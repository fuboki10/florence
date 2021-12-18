import { Injectable, UnauthorizedException } from '@nestjs/common';
import { User } from '../users/user.entity';
import { UsersService } from '../users/users.service';
import { Session, SignUp } from './dto';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { Profile } from '../users/user.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly usersService: UsersService,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}

  public async validateUser(email: string, password: string): Promise<User> {
    let user: User;

    // check if user is found
    try {
      user = await this.usersService.findOne({ where: { email } });
    } catch (error) {
      throw new UnauthorizedException('Invalid email or password!');
    }

    // check if password is right
    if (!(await user.checkPassword(password))) {
      throw new UnauthorizedException('Invalid email or password!');
    }

    delete user.password;

    return user;
  }

  public async login(user: Profile): Promise<Session> {
    const payload = { email: user.email, sub: user.id };
    const token: string = this.jwtService.sign(payload);

    const MS_IN_SECONDS = 1000;

    return {
      token: token,
      token_type: 'bearer',
      expires_in:
        this.configService.get<number>('JWT_EXPIRE_SECONDS') * MS_IN_SECONDS,
      user,
    };
  }

  public async register(signUp: SignUp): Promise<Session> {
    const user = await this.usersService.create(signUp);

    return this.login(user);
  }
}
