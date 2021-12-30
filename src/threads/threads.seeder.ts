import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { Repository } from 'typeorm';
import { Thread } from './thread.entity';
import { writeFile } from 'promise-fs';

@Injectable()
export class ThreadsSeeder implements Seeder {
  constructor(
    @InjectRepository(Thread) private readonly thread: Repository<Thread>,
  ) {}

  async seed(): Promise<any> {
    const threadsNumber = 2000000;
    // Generate 100 Threads.
    const threads = DataFactory.createForClass(Thread)
      .generate(threadsNumber)
      .map((thread) => new Thread(thread));

    // Insert into the database.
    return writeFile('threads.json', JSON.stringify(threads));
  }

  async drop(): Promise<any> {
    return this.thread.delete({});
  }
}
