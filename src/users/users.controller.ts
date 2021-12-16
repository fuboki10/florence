import {
  Body,
  Controller,
  Get,
  Put,
  Query,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { RolesGuard } from '../auth/roles.guard';
import { CourseDto } from '../courses/course.dto';
import { JwtAuthGuard } from '../auth/jwt';
import { AuthUser } from './user.decorator';
import { EditProfile, Profile } from './user.dto';
import { Role } from './user.entity';
import { CoursesService } from '../courses/courses.service';
import { FindQuery, ValidationPipe } from '../common';
import { UsersService } from './users.service';

@Controller('users')
@ApiTags('users')
export class UsersController {
  constructor(
    private readonly courseService: CoursesService,
    private readonly usersService: UsersService,
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
  ): Promise<Profile> {
    return this.usersService.update(user.id, data);
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
}
