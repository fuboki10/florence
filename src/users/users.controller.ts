import {
  BadRequestException,
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Post,
  Put,
  Query,
  Req,
  UploadedFile,
  UseGuards,
  UseInterceptors,
  UsePipes,
  Version,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { RolesGuard } from '../auth/roles.guard';
import {
  CourseDto,
  CourseLibrary,
  SimpleCourseDto,
} from '../courses/course.dto';
import { JwtAuthGuard } from '../auth/jwt';
import { AuthUser } from './user.decorator';
import {
  ChangeRole,
  EditProfile,
  GetUsersRequest,
  GetUsersResponse,
  Profile,
} from './user.dto';
import { Role } from './role.enum';
import { CoursesService } from '../courses/courses.service';
import {
  FindOneParams,
  FindQuery,
  ValidationPipe,
  editFileName,
  imageFileFilter,
  uploadFile,
  getUrlFromRequest,
} from '../common';
import { UsersService } from './users.service';
import { Session } from '../auth/dto';
import { AuthService } from '../auth/auth.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { ILike } from 'typeorm';
import { Request } from 'express';

@Controller('users')
@ApiTags('users')
export class UsersController {
  constructor(
    private readonly courseService: CoursesService,
    private readonly usersService: UsersService,
    private readonly authService: AuthService,
  ) {}

  @Version('1')
  @ApiResponse({ type: Profile })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get('me')
  public async login(
    @AuthUser() user: Profile,
    @Req() req: Request,
  ): Promise<Profile> {
    const url = getUrlFromRequest(req);
    return user.appendUrlToAvatar(url);
  }

  @Version('1')
  @UsePipes(new ValidationPipe())
  @ApiBody({ type: EditProfile })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Put('me')
  public async editProfile(
    @AuthUser() user: Profile,
    @Body() data: EditProfile,
    @Req() req: Request,
  ): Promise<Session> {
    const url = getUrlFromRequest(req);
    const newUser = await this.usersService.update(user.id, data);
    newUser.appendUrlToAvatar(url);
    return this.authService.login(newUser);
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @UsePipes(new ValidationPipe())
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Instructor, Role.Admin]))
  @ApiBearerAuth()
  @Get('me/courses')
  public async getCreatedCourses(
    @Query() query: FindQuery,
    @AuthUser() user: Profile,
  ): Promise<CourseLibrary[]> {
    return this.courseService.getCreatedCourses(query, user.id);
  }

  @Version('1')
  @ApiResponse({ type: [SimpleCourseDto] })
  @UsePipes(new ValidationPipe())
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get('me/library')
  public async getEntrolledCourses(
    @Query() query: FindQuery,
    @AuthUser() user: Profile,
  ): Promise<CourseLibrary[]> {
    return this.courseService.getEnrolledCourses(query, user.id);
  }

  @Version('1')
  @UsePipes(new ValidationPipe())
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Admin]))
  @ApiBearerAuth()
  @ApiBody({ type: GetUsersRequest })
  @ApiResponse({ type: GetUsersResponse })
  @Post()
  public async getUsers(
    @Body() getUsersRequest: GetUsersRequest,
    @Query() query: FindQuery,
    @Req() req: Request,
  ): Promise<GetUsersResponse> {
    // Get needed users
    const users = await this.usersService.find(query, {
      where: {
        ...getUsersRequest.roles.map((role) => {
          return { role };
        }),
        firstName: ILike(`${query.q}%`),
      },
    });

    // Append url to avatar
    const url = getUrlFromRequest(req);
    users.forEach((user) => {
      user.appendUrlToAvatar(url);
    });

    // Group users by role
    const output: any = users.reduce(
      (result, currentValue) => {
        delete currentValue.password;
        (result.users[currentValue['role']] =
          result.users[currentValue['role']] || []).push(currentValue);
        return result;
      },
      { users: {} },
    );

    return output;
  }

  @Version('1')
  @UsePipes(new ValidationPipe())
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Admin]))
  @ApiBearerAuth()
  @ApiBody({ type: ChangeRole })
  @ApiResponse({ type: Profile })
  @Patch(':id/role')
  public async changeRole(
    @Param() params: FindOneParams,
    @Body() changeRole: ChangeRole,
    @Req() req: Request,
  ): Promise<Profile> {
    const url = getUrlFromRequest(req);
    const user = await this.usersService.updateRole(params.id, changeRole.role);
    user.appendUrlToAvatar(url);
    return user;
  }

  @Version('1')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @ApiConsumes('multipart/form-data')
  @uploadFile('image')
  @ApiResponse({ type: Profile })
  @UseInterceptors(
    FileInterceptor('image', {
      storage: diskStorage({
        destination: './files',
        filename: editFileName,
      }),
      fileFilter: imageFileFilter,
    }),
  )
  @Post('me/avatar')
  public async uploadAvatar(
    @Req() req,
    @UploadedFile() file: Express.Multer.File,
    @AuthUser() user: Profile,
  ): Promise<Profile> {
    if (!file || req.fileValidationError) {
      throw new BadRequestException(
        'Invalid File Provided, [image files allowed]',
      );
    }

    const profile = await this.usersService.updateAvatar(user.id, file.path);

    const url = getUrlFromRequest(req);
    return profile.appendUrlToAvatar(url);
  }
}
