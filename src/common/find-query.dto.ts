import { IsNumberString } from 'class-validator';

export class FindQuery {
  @IsNumberString()
  take: number;

  @IsNumberString()
  skip: number;
}
