import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { seeder } from 'nestjs-seeder';
import { Course } from './courses/course.entity';
import { CoursesSeeder } from './courses/courses.seeder';
import { Lesson } from './lessons/lesson.entity';
import { LessonsSeeder } from './lessons/lessons.seeder';
import { Material } from './materials/material.entity';
import { MaterialsSeeder } from './materials/materials.seeder';
import { Thread } from './threads/thread.entity';
import { ThreadsSeeder } from './threads/threads.seeder';
import { User } from './users/user.entity';
import { UsersSeeder } from './users/users.seeder';

seeder({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      ignoreEnvFile: false,
      envFilePath: `${process.env.PWD}/.${process.env.NODE_ENV}.env`,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get<string>('DB_HOST', 'localhost'),
        port: configService.get<number>('DB_PORT', 5432),
        username: configService.get<string>('DB_USER'),
        password: configService.get<string>('DB_PASS'),
        database: configService.get<string>('DB_NAME', 'florence'),
        entities: [__dirname + '/**/*.entity{.ts,.js}'],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),
    TypeOrmModule.forFeature([User, Material, Lesson, Course, Thread]),
  ],
}).run([
  UsersSeeder,
  CoursesSeeder,
  LessonsSeeder,
  MaterialsSeeder,
  ThreadsSeeder,
]);
