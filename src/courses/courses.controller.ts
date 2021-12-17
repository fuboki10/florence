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
import { CourseDto, CreateCourseDto } from './course.dto';
import { CoursesService } from './courses.service';
import { FindQuery } from '../common/find-query.dto';
import { RolesGuard } from '../auth/roles.guard';
import { Role } from '../users/role.enum';
import { AuthUser } from '../users/user.decorator';
import { Profile } from '../users/user.dto';
import { UsersService } from 'src/users/users.service';

@Controller('courses')
@ApiTags('courses')
@UsePipes(new ValidationPipe())
export class CoursesController {
  constructor(
    private readonly courseService: CoursesService,
    private readonly usersSerivce: UsersService,
  ) {}

  @Version('1')
  @ApiResponse({ type: CourseDto })
  @Get(':id')
  public async getCourse(@Param() params: FindOneParams): Promise<CourseDto> {
    return this.courseService.findOne({ where: { id: params.id } });
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @Get()
  public async get(@Query() query: FindQuery): Promise<CourseDto[]> {
    return this.courseService.find(query);
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
}
