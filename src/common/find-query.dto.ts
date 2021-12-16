import { ApiProperty } from '@nestjs/swagger';
import { IsNumberString } from 'class-validator';

export class FindQuery {
  @ApiProperty({
    default: 50,
  })
  @IsNumberString()
  take: number;

  @ApiProperty({
    default: 0,
  })
  @IsNumberString()
  skip: number;
}
