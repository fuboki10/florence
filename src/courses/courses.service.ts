import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from '../users/user.entity';
import { Repository, FindOneOptions, getConnection } from 'typeorm';
import { Course } from './course.entity';
import { CourseLibrary } from './course.dto';

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

  public async getCreatedCourses(
    options: {
      take?: number;
      skip?: number;
    },
    userId: number,
  ): Promise<CourseLibrary[]> {
    return getConnection()
      .createQueryRunner()
      .query(
        `
    select courses.*, cast(count(distinct lessons.id) as integer) as lessons from courses 
    inner join lessons on lessons.course_id = courses.id
    where courses.instructor_id = $1
    group by courses.id
    limit $2
    offset $3
    `,
        [userId, options.take, options.skip],
      );
  }

  public async getEnrolledCourses(
    options: {
      take?: number;
      skip?: number;
    },
    userId: number,
  ): Promise<CourseLibrary[]> {
    return getConnection()
      .createQueryRunner()
      .query(
        `
    select courses.*, cast(count(distinct lessons.id) as integer) as lessons from courses  
    inner join lessons on lessons.course_id = courses.id
    inner join users_enrolled_courses_courses on users_enrolled_courses_courses."coursesId" = courses.id 
    where users_enrolled_courses_courses."usersId" = $1
    group by courses.id
    limit $2
    offset $3
    `,
        [userId, options.take, options.skip],
      );
  }
}
