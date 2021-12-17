import { ApiProperty } from '@nestjs/swagger';
import {
  IsDateString,
  IsMilitaryTime,
  IsNotEmpty,
  IsString,
} from 'class-validator';
import { Profile } from '../users/user.dto';

export class CreateThreadDto {
  @ApiProperty({ required: true })
  @IsString()
  @IsNotEmpty({ message: 'Text is required' })
  readonly text: string;

  @ApiProperty({ required: true })
  @IsDateString()
  @IsNotEmpty({ message: 'Date is required' })
  readonly date: string;

  @ApiProperty({ required: true })
  @IsMilitaryTime()
  @IsNotEmpty({ message: 'Time is required' })
  readonly time: string;
}

export class ThreadDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty({ required: true })
  readonly text: string;

  @ApiProperty({ required: true })
  readonly date: string;

  @ApiProperty({ required: true })
  readonly time: string;

  @ApiProperty({ required: true })
  readonly userId: number;

  @ApiProperty({ required: true })
  readonly courseId: number;

  @ApiProperty({ required: false, type: Profile })
  readonly user: Profile;
}
