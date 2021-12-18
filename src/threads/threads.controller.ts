import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Query,
  UseGuards,
  UsePipes,
  Version,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { Profile } from '../users/user.dto';
import { JwtAuthGuard } from '../auth/jwt';
import { FindOneParams, FindQuery, ValidationPipe } from '../common';
import { AuthUser } from '../users/user.decorator';
import { CreateThreadDto, ThreadDto } from './thread.dto';
import { ThreadsService } from './threads.service';

@Controller('threads')
@ApiTags('threads')
@UsePipes(new ValidationPipe())
export class ThreadsController {
  constructor(private readonly threadsService: ThreadsService) {}

  @Version('1')
  @UseGuards(JwtAuthGuard)
  @ApiBody({ type: CreateThreadDto })
  @ApiResponse({ type: ThreadDto })
  @ApiBearerAuth()
  @Post(':id')
  public async createReply(
    @Param() params: FindOneParams,
    @AuthUser() user: Profile,
    @Body() threadData: CreateThreadDto,
  ): Promise<ThreadDto> {
    return this.threadsService.createReply(params.id, user.id, threadData);
  }

  @Version('1')
  @ApiResponse({ type: [ThreadDto] })
  @Get()
  public async getThreads(@Query() query: FindQuery): Promise<ThreadDto[]> {
    return this.threadsService.find(query, { where: { parent: null } });
  }
}
