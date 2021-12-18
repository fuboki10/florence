import { ApiProperty } from '@nestjs/swagger';
import { Expose } from 'class-transformer';
import { ThreadDto } from '../threads/thread.dto';
import { LessonDto } from '../lessons/lessons.dto';
import { Profile } from 'src/users/user.dto';

export class CourseDto {
  @ApiProperty()
  @Expose()
  readonly id: number;

  @ApiProperty()
  @Expose()
  readonly description: string;

  @ApiProperty()
  @Expose()
  readonly title: string;

  @ApiProperty()
  @Expose()
  readonly category: string;

  @ApiProperty({ type: [LessonDto] })
  @Expose()
  readonly lessons: LessonDto[];

  @ApiProperty()
  @Expose()
  readonly instructor_id: number;

  @ApiProperty({ type: Profile })
  @Expose()
  readonly instructor: Profile;

  @ApiProperty({ type: [ThreadDto] })
  @Expose()
  readonly threads: ThreadDto[];
}

export class SimpleCourseDto {
  @ApiProperty()
  @Expose()
  readonly id: number;

  @ApiProperty()
  @Expose()
  readonly description: string;

  @ApiProperty()
  @Expose()
  readonly title: string;

  @ApiProperty()
  @Expose()
  readonly category: string;

  @ApiProperty()
  @Expose()
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
