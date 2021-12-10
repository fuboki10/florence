import { ApiProperty } from '@nestjs/swagger';

export class Session {
  @ApiProperty()
  readonly token: string;

  @ApiProperty()
  readonly token_type: string;

  @ApiProperty()
  readonly expires_in: number;
}
