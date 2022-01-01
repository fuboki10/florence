import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { writeFile } from 'promise-fs';
import { Repository } from 'typeorm';
import { Course } from './course.entity';

@Injectable()
export class CoursesSeeder implements Seeder {
  constructor(
    @InjectRepository(Course) private readonly course: Repository<Course>,
  ) {}

  async seed(): Promise<any> {
    const coursesNumber = 50;
    // Generate 50 Courses.
    const courses = DataFactory.createForClass(Course)
      .generate(coursesNumber)
      .map((course) => new Course(course));

    // Insert into the database.
    return this.course.save(courses);
  }

  async drop(): Promise<any> {
    return this.course.delete({});
  }
}
