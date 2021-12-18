import { Controller, Get, Param, Res } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('files/:filename')
  public async getFile(@Param('filename') file, @Res() res) {
    return res.sendFile(file, { root: './files' });
  }
}
