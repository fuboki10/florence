import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt } from 'class-validator';

export class FindQuery {
  @ApiProperty({
    default: 50,
  })
  @IsInt()
  @Type(() => Number)
  readonly take: number = 50;

  @ApiProperty({
    default: 0,
  })
  @IsInt()
  @Type(() => Number)
  readonly skip: number = 0;
}
