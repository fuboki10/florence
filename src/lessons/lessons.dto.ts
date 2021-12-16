import { ApiProperty } from '@nestjs/swagger';

export class LessonDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;

  @ApiProperty()
  readonly url: string;

  @ApiProperty()
  readonly course_id: number;
}

export class CreateLessonDto {
  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;

  @ApiProperty()
  readonly url: string;

  @ApiProperty()
  readonly course_id: number;
}
