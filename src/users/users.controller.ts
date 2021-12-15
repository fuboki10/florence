import { Controller, Get, UseGuards, Version } from '@nestjs/common';
import { ApiBearerAuth, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/jwt';
import { AuthUser } from './user.decorator';
import { Profile } from './user.dto';
import { User } from './user.entity';

@Controller('users')
@ApiTags('users')
export class UsersController {
  @Version('1')
  @ApiResponse({ type: Profile })
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get('me')
  public async login(@AuthUser() user: User): Promise<Profile> {
    return user;
  }
}
