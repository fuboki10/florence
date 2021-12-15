import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
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
    const course = await this.courseRepository.findOne(where);

    if (!course) {
      throw new NotFoundException('course is not Found!');
    }

    return course;
  }

  public async find({
    limit,
    offset,
    where,
  }: {
    limit?: number;
    offset?: number;
    where?: FindOneOptions<Course>;
  }): Promise<Course[]> {
    return this.courseRepository.find({ where, skip: offset, take: limit });
  }
}
