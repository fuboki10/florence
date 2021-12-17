import { forwardRef, Module } from '@nestjs/common';
import { CoursesService } from './courses.service';
import { CoursesController } from './courses.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Course } from './course.entity';
import { UsersModule } from '../users/users.module';
import { ThreadsModule } from 'src/threads/threads.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Course]),
    forwardRef(() => UsersModule),
    ThreadsModule,
  ],
  providers: [CoursesService],
  controllers: [CoursesController],
  exports: [CoursesService],
})
export class CoursesModule {}
