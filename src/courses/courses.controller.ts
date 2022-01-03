import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Query,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { FindOneParams, ValidationPipe } from '../common';
import { JwtAuthGuard } from '../auth/jwt';
import { CourseDto, CreateCourseDto, SimpleCourseDto } from './course.dto';
import { CoursesService } from './courses.service';
import { FindQuery } from '../common/find-query.dto';
import { RolesGuard } from '../auth/roles.guard';
import { Role } from '../users/role.enum';
import { AuthUser } from '../users/user.decorator';
import { Profile } from '../users/user.dto';
import { UsersService } from '../users/users.service';
import { ThreadsService } from '../threads/threads.service';
import { CreateThreadDto, ThreadDto } from '../threads/thread.dto';
import { ILike } from 'typeorm';
import { User } from '../users/user.entity';

@Controller('courses')
@ApiTags('courses')
@UsePipes(new ValidationPipe())
export class CoursesController {
  constructor(
    private readonly courseService: CoursesService,
    private readonly usersSerivce: UsersService,
    private readonly threadsService: ThreadsService,
  ) {}

  @Version('1')
  @ApiResponse({ type: CourseDto })
  @Get(':id')
  public async getCourse(@Param() params: FindOneParams): Promise<CourseDto> {
    const course = await this.courseService.findOne({
      where: { id: params.id },
    });

    course.threads = await this.threadsService.find(
      {},
      {
        where: { courseId: course.id, parent: null },
        order: { date: 'ASC', time: 'ASC' },
      },
    );

    return course;
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get()
  public async get(
    @Query() query: FindQuery,
    @AuthUser() user: Profile,
  ): Promise<SimpleCourseDto[]> {
    return this.courseService.find(
      query,
      {
        where: { title: ILike(`${query.q}%`) },
      },
      await this.usersSerivce.findOne({ where: { id: user.id } }),
    );
  }

  @Version('1')
  @ApiResponse({ type: CourseDto })
  @ApiBody({ type: CreateCourseDto })
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Instructor, Role.Admin]))
  @ApiBearerAuth()
  @Post()
  public async createCourse(
    @Body() course: CreateCourseDto,
    @AuthUser() user: Profile,
  ): Promise<CourseDto> {
    return this.courseService.create({ ...course, instructor_id: user.id });
  }

  @Version('1')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post(':id/enroll')
  public async enrollInCourse(
    @Param() params: FindOneParams,
    @AuthUser() user: Profile,
  ): Promise<void> {
    const course = await this.courseService.findOne({
      where: { id: params.id },
    });
    return this.usersSerivce.enrollInCourse(user.id, course);
  }

  @Version('1')
  @UseGuards(JwtAuthGuard)
  @ApiBody({ type: CreateThreadDto })
  @ApiResponse({ type: ThreadDto })
  @ApiBearerAuth()
  @Post(':id/threads')
  public async createThread(
    @Param() params: FindOneParams,
    @AuthUser() user: Profile,
    @Body() threadData: CreateThreadDto,
  ): Promise<ThreadDto> {
    return this.threadsService.create({
      ...threadData,
      userId: user.id,
      courseId: params.id,
    });
  }
}
