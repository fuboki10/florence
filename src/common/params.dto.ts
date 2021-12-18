import { ApiProperty } from '@nestjs/swagger';
import { IsNumberString } from 'class-validator';

export class FindOneParams {
  @ApiProperty({ type: Number })
  @IsNumberString()
  id: number;
}
