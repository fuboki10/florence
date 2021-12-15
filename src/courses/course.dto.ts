import { ApiProperty } from '@nestjs/swagger';

export class CourseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;
}

export class CreateCourseDto {
  @ApiProperty()
  readonly description: string;

  @ApiProperty()
  readonly title: string;
}
