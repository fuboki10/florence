import { ApiProperty } from '@nestjs/swagger';

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
}
