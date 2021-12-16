import { ApiProperty } from '@nestjs/swagger';
import { Profile } from '../../users/user.dto';

export class Session {
  @ApiProperty()
  readonly token: string;

  @ApiProperty()
  readonly token_type: string;

  @ApiProperty()
  readonly expires_in: number;

  @ApiProperty({ type: Profile })
  readonly user: Profile;
}
