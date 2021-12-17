import {
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Post,
  Put,
  Query,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { RolesGuard } from '../auth/roles.guard';
import { CourseDto, SimpleCourseDto } from '../courses/course.dto';
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
import { FindOneParams, FindQuery, ValidationPipe } from '../common';
import { UsersService } from './users.service';
import { Session } from '../auth/dto';
import { AuthService } from '../auth/auth.service';

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
  public async login(@AuthUser() user: Profile): Promise<Profile> {
    return user;
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
  ): Promise<Session> {
    const newUser = await this.usersService.update(user.id, data);
    return this.authService.login(newUser);
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Instructor, Role.Admin]))
  @ApiBearerAuth()
  @Get('me/courses')
  public async getCreatedCourses(
    @Query() query: FindQuery,
    @AuthUser() user: Profile,
  ): Promise<CourseDto[]> {
    return this.courseService.find(query, {
      where: { instructor_id: user.id },
    });
  }

  @Version('1')
  @ApiResponse({ type: [SimpleCourseDto] })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get('me/library')
  public async getEntrolledCourses(
    @AuthUser() user: Profile,
  ): Promise<SimpleCourseDto[]> {
    return this.usersService.getEnrolledCourses(user.id);
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
  ): Promise<GetUsersResponse> {
    // Get needed users
    const users = await this.usersService.find(query, {
      where: getUsersRequest.roles.map((role) => {
        return { role };
      }),
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
  ): Promise<Profile> {
    return this.usersService.updateRole(params.id, changeRole.role);
  }
}
