import { IsNumberString } from 'class-validator';

export class FindQuery {
  @IsNumberString()
  limit: number;

  @IsNumberString()
  offset: number;
}
