import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { Repository } from 'typeorm';
import { Role } from './role.enum';
import { User } from './user.entity';

const userSeed = [
  {
    email: 'ahmed@walid.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Ahmed',
    lastName: 'Walid',
    role: Role.Learner,
  },
  {
    email: 'abdelrahman@tarek.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Abdelrahman',
    lastName: 'Tarek',
    role: Role.Admin,
  },
  {
    email: 'hassan@mohammed.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Hassan',
    lastName: 'Mohammed',
    role: Role.Instructor,
  },
  {
    email: 'abdelrahman@arafat.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Abdelrahman',
    lastName: 'Arafat',
    role: Role.Admin,
  },
];

@Injectable()
export class UsersSeeder implements Seeder {
  constructor(
    @InjectRepository(User) private readonly user: Repository<User>,
  ) {}

  async seed(): Promise<any> {
    // Generate 10 users.
    const users = DataFactory.createForClass(User).generate(10);

    // Insert into the database.
    return this.user.save(
      [...userSeed, ...users].map((user) => new User(user)),
    );
  }

  async drop(): Promise<any> {
    return this.user.delete({});
  }
}
