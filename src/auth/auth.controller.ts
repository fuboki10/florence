import { Controller, Post, UseGuards, Version } from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { AuthUser } from '../users/user.decorator';
import { User } from '../users/user.entity';
import { AuthService } from './auth.service';
import { SignIn, Session } from './dto';
import { LocalAuthGuard } from './local/local-auth.guard';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Version('1')
  @UseGuards(LocalAuthGuard)
  @ApiBody({ type: SignIn })
  @ApiResponse({ type: Session })
  @Post('signin')
  public async login(@AuthUser() user: User): Promise<Session> {
    return this.authService.login(user);
  }
}
