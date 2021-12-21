import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { Repository } from 'typeorm';
import { Lesson } from './lesson.entity';

@Injectable()
export class LessonsSeeder implements Seeder {
  constructor(
    @InjectRepository(Lesson) private readonly lesson: Repository<Lesson>,
  ) {}

  async seed(): Promise<any> {
    // Generate 100 Lessons.
    const Lessons = DataFactory.createForClass(Lesson).generate(100);

    // Insert into the database.
    return this.lesson.save(Lessons.map((lesson) => new Lesson(lesson)));
  }

  async drop(): Promise<any> {
    return this.lesson.delete({});
  }
}
