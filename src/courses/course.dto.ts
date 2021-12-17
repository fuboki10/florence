import { ApiProperty } from '@nestjs/swagger';
import { LessonDto } from '../lessons/lessons.dto';

export class CourseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;

  @ApiProperty()
  readonly category: string;

  @ApiProperty({ type: [LessonDto] })
  readonly lessons: LessonDto[];

  @ApiProperty()
  readonly instructor_id: number;
}

export class CreateCourseDto {
  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;

  @ApiProperty()
  readonly category: string;
}
