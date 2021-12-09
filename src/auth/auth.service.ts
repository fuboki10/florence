import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {
  public async validateUser(
    username: string,
    inputPassword: string,
  ): Promise<any> {
    return null;
  }
}
