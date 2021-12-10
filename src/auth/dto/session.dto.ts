import { ApiProperty } from '@nestjs/swagger';

export class Session {
  @ApiProperty()
  public access_token: string;

  @ApiProperty()
  public token_type: string;

  @ApiProperty()
  public expires_in: number;
}
