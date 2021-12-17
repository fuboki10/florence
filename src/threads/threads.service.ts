import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FindOneOptions, Repository } from 'typeorm';
import { Thread } from './thread.entity';

@Injectable()
export class ThreadsService {
  constructor(
    @InjectRepository(Thread)
    private threadRepository: Repository<Thread>,
  ) {}

  public async create(data: Partial<Thread>): Promise<Thread> {
    const thread = await this.threadRepository.save(new Thread(data));
    return this.findOne({ where: { id: thread.id } });
  }

  public async findOne(where: FindOneOptions<Thread>): Promise<Thread> {
    const thread = await this.threadRepository.findOne({
      ...where,
      relations: ['user'],
    });

    if (!thread) {
      throw new NotFoundException('thread is not Found!');
    }

    return thread;
  }

  public async find(
    options: {
      take?: number;
      skip?: number;
    },
    where?: FindOneOptions<Thread>,
  ): Promise<Thread[]> {
    return this.threadRepository.find({
      ...options,
      ...where,
      relations: ['users'],
    });
  }
}
