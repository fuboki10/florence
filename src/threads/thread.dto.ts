import { ApiProperty } from '@nestjs/swagger';
import { Expose, Type } from 'class-transformer';
import {
  IsDateString,
  IsMilitaryTime,
  IsNotEmpty,
  IsString,
  Matches,
} from 'class-validator';
import { Profile } from '../users/user.dto';

export class CreateThreadDto {
  @ApiProperty({ required: true })
  @IsString()
  @IsNotEmpty({ message: 'Text is required' })
  @Expose()
  readonly text: string;

  @ApiProperty({ required: true })
  @IsDateString()
  @IsNotEmpty({ message: 'Date is required' })
  @Expose()
  readonly date: string;

  @ApiProperty({ required: true })
  @Matches(new RegExp(/\d\d:\d\d(:\d\d)?/), {
    message: 'Please Enter a valid time (hh:mm or hh:mm:ss)',
  })
  @IsNotEmpty({ message: 'Time is required' })
  @Expose()
  readonly time: string;
}

export class ThreadDto {
  @ApiProperty()
  @Expose()
  readonly id: number;

  @ApiProperty({ required: true })
  @Expose()
  readonly text: string;

  @ApiProperty({ required: true })
  @Expose()
  readonly date: string;

  @ApiProperty({ required: true })
  @Expose()
  readonly time: string;

  @ApiProperty({ required: true })
  @Expose()
  readonly userId: number;

  @ApiProperty({ required: true })
  @Expose()
  readonly courseId: number;

  @ApiProperty({ required: false, type: Profile })
  @Type(() => Profile)
  @Expose()
  readonly user: Profile;

  @ApiProperty({ required: false, type: [ThreadDto] })
  @Expose()
  readonly replies: ThreadDto[];
}
