import { ApiProperty } from '@nestjs/swagger';
import { Exclude, Expose } from 'class-transformer';
import {
  IsDateString,
  IsEmail,
  IsEnum,
  MinLength,
  IsOptional,
  IsDefined,
  IsNotEmpty,
  ValidateIf,
} from 'class-validator';
import { Role } from './role.enum';
export class Profile {
  @ApiProperty()
  @Expose()
  readonly id: number;

  @ApiProperty()
  @Expose()
  readonly firstName: string;

  @ApiProperty()
  @Expose()
  readonly lastName: string;

  @ApiProperty()
  @Expose()
  readonly birthDate: Date;

  @ApiProperty()
  @Expose()
  readonly email: string;

  @ApiProperty()
  @Expose()
  readonly role: Role;

  @ApiProperty()
  @Expose()
  readonly name: string;

  @Exclude()
  readonly password: string;

  @ApiProperty()
  @Expose()
  readonly avatar: string;
}

export class EditProfile {
  @ApiProperty({ required: false })
  @IsOptional()
  @Expose()
  readonly firstName?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @Expose()
  readonly lastName?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsDateString()
  @Expose()
  readonly birthDate?: Date;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsEmail()
  @Expose()
  readonly email?: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsEnum(Role)
  @Expose()
  readonly role?: Role;

  @ApiProperty({ required: true })
  @IsNotEmpty()
  @IsDefined()
  @MinLength(6, {
    message: 'The password was invalid',
  })
  @Expose()
  public password: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsDefined()
  @MinLength(6)
  @ValidateIf((e) => e.newPassword !== '')
  @Expose()
  readonly newPassword?: string;
}

export class GetUsersRequest {
  @ApiProperty({ required: true })
  @IsEnum(Role, { each: true })
  @Expose()
  readonly roles: Role[] = [];
}

type UsersRecord = Record<Role, Profile>;

export class GetUsersResponse {
  @ApiProperty({
    type: 'object',
    properties: {
      admin: {
        type: 'array',
        items: {
          $ref: '#/components/schemas/Profile',
        },
      },
      instructor: {
        type: 'array',
        items: {
          $ref: '#/components/schemas/Profile',
        },
      },
      learner: {
        type: 'array',
        items: {
          $ref: '#/components/schemas/Profile',
        },
      },
    },
  })
  @Expose()
  readonly users: UsersRecord;
}

export class ChangeRole {
  @ApiProperty({ required: true })
  @IsEnum(Role)
  @Expose()
  readonly role: Role;
}
