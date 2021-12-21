import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { Repository } from 'typeorm';
import { Course } from './course.entity';

@Injectable()
export class CoursesSeeder implements Seeder {
  constructor(
    @InjectRepository(Course) private readonly course: Repository<Course>,
  ) {}

  async seed(): Promise<any> {
    // Generate 50 Courses.
    const courses = DataFactory.createForClass(Course).generate(50);

    // Insert into the database.
    return this.course
      .save(courses.map((course) => new Course(course)))
      .catch(console.log);
  }

  async drop(): Promise<any> {
    return this.course.delete({});
  }
}
