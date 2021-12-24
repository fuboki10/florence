import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { writeFile } from 'promise-fs';
import { Repository } from 'typeorm';
import { Role } from './role.enum';
import { User } from './user.entity';

@Injectable()
export class UsersSeeder implements Seeder {
  constructor(
    @InjectRepository(User) private readonly user: Repository<User>,
  ) {}

  async seed(): Promise<any> {
    const instructors = DataFactory.createForClass(User)
      .generate(1000)
      .map((user) => {
        user.role = Role.Instructor;
        return new User(user);
      });

    const users = DataFactory.createForClass(User)
      .generate(1000000 - 1000)
      .map((user) => new User(user));

    return writeFile('users.json', JSON.stringify([...instructors, ...users]));

    // Insert into the database.
    //return this.user.save([...instructors, ...users]);
  }

  async drop(): Promise<any> {
    return this.user.delete({});
  }
}
