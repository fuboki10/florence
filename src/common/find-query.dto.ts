import { ApiProperty } from '@nestjs/swagger';
import { IsNumberString } from 'class-validator';

export class FindQuery {
  @ApiProperty({
    default: 50,
  })
  @IsNumberString()
  readonly take: number = 50;

  @ApiProperty({
    default: 0,
  })
  @IsNumberString()
  readonly skip: number = 0;
}
