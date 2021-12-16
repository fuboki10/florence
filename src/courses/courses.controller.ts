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
import {
  ApiBearerAuth,
  ApiBody,
  ApiParam,
  ApiQuery,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { FindOneParams, ValidationPipe } from '../common';
import { JwtAuthGuard } from '../auth/jwt';
import { CourseDto, CreateCourseDto } from './course.dto';
import { CoursesService } from './courses.service';
import { FindQuery } from '../common/find-query.dto';

@Controller('courses')
@ApiTags('courses')
@UsePipes(new ValidationPipe())
export class CoursesController {
  constructor(private readonly courseService: CoursesService) {}

  @Version('1')
  @ApiResponse({ type: CourseDto })
  @ApiParam({ name: 'id', type: Number })
  @Get(':id')
  public async getCourse(@Param() params: FindOneParams): Promise<CourseDto> {
    return this.courseService.findOne({ where: { id: params.id } });
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @ApiQuery({ type: FindQuery })
  @Get()
  public async get(@Query() query: FindQuery): Promise<CourseDto[]> {
    return this.courseService.find(query);
  }

  @Version('1')
  @ApiResponse({ type: CreateCourseDto })
  @ApiBody({ type: CreateCourseDto })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post()
  public async createCourse(
    @Body() course: CreateCourseDto,
  ): Promise<CourseDto> {
    return this.courseService.create(course);
  }
}
