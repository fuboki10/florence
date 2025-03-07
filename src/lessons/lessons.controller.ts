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
import { JwtAuthGuard } from '../auth/jwt';
import { FindQuery } from '../common/find-query.dto';
import { FindOneParams, ValidationPipe } from '../common';
import { LessonDto, CreateLessonDto } from './lessons.dto';
import { LessonsService } from './lessons.service';
import { ILike } from 'typeorm';

@Controller('lessons')
@ApiTags('lessons')
@UsePipes(new ValidationPipe())
export class LessonsController {
  constructor(private readonly lessonsService: LessonsService) {}

  @Version('1')
  @ApiResponse({ type: LessonDto })
  @Get(':id')
  public async getLesson(@Param() params: FindOneParams): Promise<LessonDto> {
    return this.lessonsService.findOne({ where: { id: params.id } });
  }

  @Version('1')
  @ApiResponse({ type: [LessonDto] })
  @Get()
  public async get(@Query() query: FindQuery): Promise<LessonDto[]> {
    return this.lessonsService.find(query, {
      where: { title: ILike(`${query.q}%`) },
    });
  }

  @Version('1')
  @ApiResponse({ type: LessonDto })
  @ApiBody({ type: CreateLessonDto })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post()
  public async createLesson(
    @Body() lesson: CreateLessonDto,
  ): Promise<LessonDto> {
    return this.lessonsService.create(lesson);
  }
}
