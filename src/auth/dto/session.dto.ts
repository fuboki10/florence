import { ApiProperty } from '@nestjs/swagger';
import { Expose, Type } from 'class-transformer';
import { Profile } from '../../users/user.dto';

export class Session {
  @ApiProperty()
  @Expose()
  readonly token: string;

  @ApiProperty()
  @Expose()
  readonly token_type: string;

  @ApiProperty()
  @Expose()
  readonly expires_in: number;

  @ApiProperty({ type: Profile })
  @Type(() => Profile)
  @Expose()
  readonly user: Profile;
}
