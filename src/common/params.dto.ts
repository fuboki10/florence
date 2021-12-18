import { ApiProperty } from '@nestjs/swagger';
import { Expose, Type } from 'class-transformer';
import { IsInt } from 'class-validator';

export class FindOneParams {
  @ApiProperty()
  @IsInt()
  @Type(() => Number)
  @Expose()
  readonly id: number;
}
