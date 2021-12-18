import { ApiProperty } from '@nestjs/swagger';
import { Expose } from 'class-transformer';
import { IsDefined, IsNotEmpty, IsEmail, Length } from 'class-validator';

export class SignIn {
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
}
