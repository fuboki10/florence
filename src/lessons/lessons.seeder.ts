import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { writeFile } from 'promise-fs';
import { Repository } from 'typeorm';
import { Lesson } from './lesson.entity';

@Injectable()
export class LessonsSeeder implements Seeder {
  constructor(
    @InjectRepository(Lesson) private readonly lesson: Repository<Lesson>,
  ) {}

  async seed(): Promise<any> {
    const lessonsNumber = 1000000;
    // Generate 100 Lessons.
    const lessons = DataFactory.createForClass(Lesson)
      .generate(lessonsNumber)
      .map((lesson) => new Lesson(lesson));

    // Insert into the database.
    return writeFile('lessons.json', JSON.stringify(lessons));
    return this.lesson.save(lessons);
  }

  async drop(): Promise<any> {
    return this.lesson.delete({});
  }
}
