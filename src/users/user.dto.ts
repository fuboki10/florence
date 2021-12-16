import { ApiProperty } from '@nestjs/swagger';
import {
  IsDateString,
  IsEmail,
  IsEnum,
  MinLength,
  IsOptional,
  IsDefined,
  IsNotEmpty,
} from 'class-validator';
import { Role } from './user.entity';
export class Profile {
  @ApiProperty()
  readonly id: string;

  @ApiProperty()
  readonly firstName: string;

  @ApiProperty()
  readonly lastName: string;

  @ApiProperty()
  readonly birthDate: Date;

  @ApiProperty()
  readonly email: string;

  @ApiProperty()
  readonly role: Role;
}

export class EditProfile {
  @ApiProperty({ required: false })
  @IsOptional()
  readonly firstName?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  readonly lastName?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsDateString()
  readonly birthDate?: Date;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsEmail()
  readonly email?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsEnum(Role)
  readonly role?: Role;

  @ApiProperty({ required: true })
  @IsNotEmpty()
  @IsDefined()
  @MinLength(6)
  public password: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsDefined()
  @MinLength(6)
  readonly newPassword?: string;
}
