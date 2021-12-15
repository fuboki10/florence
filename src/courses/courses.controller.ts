import {
  Controller,
  Get,
  Param,
  Query,
  UseGuards,
  Version,
} from '@nestjs/common';
import { ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { FindOneParams } from '../common';
import { JwtAuthGuard } from '../auth/jwt';
import { CourseDto } from './course.dto';
import { CoursesService } from './courses.service';
import { FindQuery } from 'src/common/find-query.dto';

@Controller('courses')
@ApiTags('courses')
export class CoursesController {
  constructor(private readonly courseService: CoursesService) {}

  @Version('1')
  @ApiResponse({ type: CourseDto })
  @UseGuards(JwtAuthGuard)
  @Get(':id')
  public async getCourse(@Param() params: FindOneParams): Promise<CourseDto> {
    return this.courseService.findOne({ where: { id: params.id } });
  }

  @Version('1')
  @ApiResponse({ type: [CourseDto] })
  @ApiQuery({ type: FindQuery })
  @UseGuards(JwtAuthGuard)
  @Get()
  public async get(@Query() query: FindQuery): Promise<CourseDto[]> {
    return this.courseService.find(query);
  }
}
