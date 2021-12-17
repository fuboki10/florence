import { ApiProperty } from '@nestjs/swagger';
import {
  IsDefined,
  IsNotEmpty,
  IsEmail,
  MinLength,
  IsDateString,
  IsAlpha,
  IsEnum,
} from 'class-validator';
import { Role } from '../../users/role.enum';

export class SignUp {
  @ApiProperty({ required: true })
  @IsDefined()
  @IsEmail()
  readonly email: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @MinLength(6)
  readonly password: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @IsDateString()
  readonly birthDate: Date;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @IsAlpha()
  readonly firstName: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @IsAlpha()
  readonly lastName: string;

  @ApiProperty({ required: false })
  @IsEnum(Role)
  readonly role?: Role;
}
