import { ApiProperty } from '@nestjs/swagger';
import {
  IsDefined,
  IsNotEmpty,
  IsEmail,
  MinLength,
  IsDateString,
  IsAlpha,
} from 'class-validator';

export class SignUp {
  @ApiProperty()
  @IsDefined()
  @IsEmail()
  readonly email: string;

  @ApiProperty()
  @IsDefined()
  @IsNotEmpty()
  @MinLength(8)
  readonly password: string;

  @ApiProperty()
  @IsDefined()
  @IsNotEmpty()
  @IsDateString()
  readonly birthDate: Date;

  @ApiProperty()
  @IsDefined()
  @IsNotEmpty()
  @IsAlpha()
  readonly firstName: string;

  @ApiProperty()
  @IsDefined()
  @IsNotEmpty()
  @IsAlpha()
  readonly lastName: string;
}
