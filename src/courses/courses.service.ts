import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from '../users/user.entity';
import { Repository, FindOneOptions } from 'typeorm';
import { Course } from './course.entity';

@Injectable()
export class CoursesService {
  constructor(
    @InjectRepository(Course)
    private courseRepository: Repository<Course>,
  ) {}

  public async create(data: Partial<Course>): Promise<Course> {
    return this.courseRepository.save(new Course(data));
  }

  public async findOne(where: FindOneOptions<Course>): Promise<Course> {
    const course = await this.courseRepository.findOne({
      ...where,
      relations: ['lessons', 'instructor', 'materials'],
    });

    if (!course) {
      throw new NotFoundException('course is not Found!');
    }

    return course;
  }

  public async find(
    options: {
      take?: number;
      skip?: number;
    },
    where?: FindOneOptions<Course>,
    user?: User,
  ): Promise<Course[]> {
    const courses: Course[] = await this.courseRepository.find({
      ...options,
      ...where,
    });

    if (user) {
      const enrolledCourses: Course[] = await user.enrolledCourses;

      const enrolledCoursesIds: number[] = enrolledCourses.map(
        (course) => course.id,
      );

      // remove entrolled courses
      return courses.filter(
        (course) => !enrolledCoursesIds.includes(course.id),
      );
    }

    return courses;
  }
}
