import { ApiProperty } from '@nestjs/swagger';
import { IsDefined, IsNotEmpty, IsEmail, MinLength } from 'class-validator';

export class SignIn {
  @ApiProperty({ required: true })
  @IsDefined()
  @IsEmail()
  readonly email: string;

  @ApiProperty({ required: true })
  @IsDefined()
  @IsNotEmpty()
  @MinLength(8)
  readonly password: string;
}
