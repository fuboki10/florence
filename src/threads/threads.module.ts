import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Thread } from './thread.entity';
import { ThreadsService } from './threads.service';
import { ThreadsController } from './threads.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Thread])],
  providers: [ThreadsService],
  exports: [ThreadsService],
  controllers: [ThreadsController],
})
export class ThreadsModule {}
