import { ApiProperty } from '@nestjs/swagger';
import { Expose } from 'class-transformer';

export class LessonDto {
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
  readonly url: string;

  @ApiProperty()
  @Expose()
  readonly course_id: number;
}

export class CreateLessonDto {
  @ApiProperty()
  @Expose()
  readonly description: string;

  @ApiProperty()
  @Expose()
  readonly title: string;

  @ApiProperty()
  @Expose()
  readonly url: string;

  @ApiProperty()
  @Expose()
  readonly course_id: number;
}
