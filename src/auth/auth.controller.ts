import {
  Body,
  Controller,
  Post,
  Req,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { Profile } from '../users/user.dto';
import { getUrlFromRequest, ValidationPipe } from '../common';
import { AuthUser } from '../users/user.decorator';
import { AuthService } from './auth.service';
import { SignIn, Session, SignUp } from './dto';
import { LocalAuthGuard } from './local/local-auth.guard';
import { Request } from 'express';

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
  public async login(
    @AuthUser() user: Profile,
    @Req() req: Request,
  ): Promise<Session> {
    const session = await this.authService.login(user);
    const url = getUrlFromRequest(req);
    session.user.appendUrlToAvatar(url);
    return session;
  }

  @Version('1')
  @ApiBody({ type: SignUp })
  @ApiResponse({ type: Session })
  @UsePipes(new ValidationPipe())
  @Post('signup')
  public async register(
    @Body() signUp: SignUp,
    @Req() req: Request,
  ): Promise<Session> {
    const session = await this.authService.register(signUp);
    const url = getUrlFromRequest(req);
    session.user.appendUrlToAvatar(url);
    return session;
  }
}
