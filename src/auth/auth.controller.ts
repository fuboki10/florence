import {
  Body,
  Controller,
  Post,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { Profile } from '../users/user.dto';
import { ValidationPipe } from '../common';
import { AuthUser } from '../users/user.decorator';
import { AuthService } from './auth.service';
import { SignIn, Session, SignUp } from './dto';
import { LocalAuthGuard } from './local/local-auth.guard';

@ApiTags('auth')
@Controller('auth')
@UsePipes(new ValidationPipe())
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Version('1')
  @ApiResponse({ type: Session })
  @ApiBody({ type: SignIn })
  @UseGuards(LocalAuthGuard)
  @Post('signin')
  public async login(@AuthUser() user: Profile): Promise<Session> {
    return await this.authService.login(user);
  }

  @Version('1')
  @ApiBody({ type: SignUp })
  @ApiResponse({ type: Session })
  @UsePipes(new ValidationPipe())
  @Post('signup')
  public async register(@Body() signUp: SignUp): Promise<Session> {
    return this.authService.register(signUp);
  }
}
