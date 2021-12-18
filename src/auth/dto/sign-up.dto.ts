import { ApiProperty } from '@nestjs/swagger';
import { Expose } from 'class-transformer';
import {
  IsDefined,
  IsNotEmpty,
  IsEmail,
  IsDateString,
  IsAlpha,
  IsEnum,
  Length,
} from 'class-validator';
import { Role } from '../../users/role.enum';

export class SignUp {
  @ApiProperty({ required: true })
  @IsEmail({}, { message: 'Incorrect email' })
  @IsNotEmpty({ message: 'The email is required' })
  @Expose()
  readonly email: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @Length(6, 30, {
    message:
      'The password must be at least 6 but not longer than 30 characters',
  })
  @IsNotEmpty({ message: 'The password is required' })
  @Expose()
  readonly password: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsDateString()
  @IsNotEmpty({ message: 'The birthdate is required' })
  @Expose()
  readonly birthDate: Date;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsAlpha()
  @IsNotEmpty({ message: 'The firstName is required' })
  @Expose()
  readonly firstName: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsAlpha()
  @IsNotEmpty({ message: 'The lastName is required' })
  @Expose()
  readonly lastName: string;

  @ApiProperty({ required: false })
  @IsEnum(Role)
  @Expose()
  readonly role?: Role;
}
