import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FindOneOptions, Repository } from 'typeorm';
import { Lesson } from './lesson.entity';

@Injectable()
export class LessonsService {
  constructor(
    @InjectRepository(Lesson)
    private lessonRepository: Repository<Lesson>,
  ) {}

  public async create(data: Partial<Lesson>): Promise<Lesson> {
    return this.lessonRepository.save(new Lesson(data));
  }

  public async findOne(where: FindOneOptions<Lesson>): Promise<Lesson> {
    const lesson = await this.lessonRepository.findOne(where);

    if (!lesson) {
      throw new NotFoundException('Lesson is not Found!');
    }

    return lesson;
  }

  public async find(options: {
    take?: number;
    skip?: number;
    where?: FindOneOptions<Lesson>;
  }): Promise<Lesson[]> {
    return this.lessonRepository.find(options);
  }
}
