import { ApiProperty } from '@nestjs/swagger';
import { Expose, Type } from 'class-transformer';
import { ThreadDto } from '../threads/thread.dto';
import { LessonDto } from '../lessons/lessons.dto';
import { Profile } from '../users/user.dto';
import { MaterialDto } from '../materials/material.dto';

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

  @ApiProperty({ type: [MaterialDto] })
  @Expose()
  readonly materials: MaterialDto[];
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

  @ApiProperty({ type: Profile })
  @Expose()
  readonly instructor: Profile;
}

export class CreateCourseDto {
  @ApiProperty()
  @Expose()
  readonly description: string;

  @ApiProperty()
  @Expose()
  readonly title: string;

  @ApiProperty()
  @Expose()
  readonly category: string;
}

export class CourseLibrary {
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

  @ApiProperty()
  @Expose()
  @Type(() => Number)
  readonly lessons: number;
}
