import { ApiProperty } from '@nestjs/swagger';
import { Expose, Type } from 'class-transformer';
import { IsInt, IsOptional, IsString } from 'class-validator';

export class FindQuery {
  @ApiProperty({
    default: 50,
  })
  @IsInt()
  @Expose()
  @Type(() => Number)
  readonly take: number = 50;

  @ApiProperty({
    default: 0,
  })
  @IsInt()
  @Expose()
  @Type(() => Number)
  readonly skip: number = 0;

  @ApiProperty({ required: false, default: '' })
  @IsString()
  @Expose()
  readonly q: string = '';
}
