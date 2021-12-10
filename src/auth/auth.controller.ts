import {
  Body,
  Controller,
  Post,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ValidationPipe } from '../common/validation.pipe';
import { AuthUser } from '../users/user.decorator';
import { User } from '../users/user.entity';
import { AuthService } from './auth.service';
import { SignIn, Session, SignUp } from './dto';
import { LocalAuthGuard } from './local/local-auth.guard';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Version('1')
  @ApiResponse({ type: Session })
  @ApiBody({ type: SignIn })
  @UseGuards(LocalAuthGuard)
  @Post('signin')
  public async login(@AuthUser() user: User): Promise<Session> {
    return this.authService.login(user);
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
