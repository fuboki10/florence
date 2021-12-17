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
import { Role } from './role.enum';
export class Profile {
  @ApiProperty()
  readonly id: number;

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

  @ApiProperty()
  readonly name: string;
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

export class GetUsersRequest {
  @ApiProperty({ required: true })
  @IsEnum(Role, { each: true })
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
  readonly users: UsersRecord;
}

export class ChangeRole {
  @ApiProperty({ required: true })
  @IsEnum(Role)
  readonly role: Role;
}
