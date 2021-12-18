import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PasswordInvalidException } from '../common';
import { FindOneOptions, Repository } from 'typeorm';
import { EditProfile, Profile } from './user.dto';
import { User } from './user.entity';
import { Role } from './role.enum';
import { Course } from '../courses/course.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  public async create(data: Partial<User>): Promise<User> {
    return this.userRepository.save(new User(data));
  }

  public async findOne(where: FindOneOptions<User>): Promise<User> {
    const query = this.userRepository
      .createQueryBuilder('user')
      .addSelect('user.password');

    Object.entries(where.where).forEach((e) => {
      query.where(`user.${e[0]} = :val`, { val: e[1] });
    });

    const user = await query.getOne();

    if (!user) {
      throw new NotFoundException('User is not Found!');
    }

    return user;
  }

  public async update(id: number, data: EditProfile): Promise<User> {
    const user = await this.findOne({ where: { id } });

    // check if password is correct
    if (!(await user.checkPassword(data.password))) {
      throw new PasswordInvalidException();
    }

    data.password = data.newPassword ?? data.password;

    const { newPassword, ...partialUser } = data;

    // update
    Object.keys(partialUser).forEach((key) => {
      user[key] = partialUser[key] || user[key];
    });

    await this.userRepository.save(user);

    delete user.password;

    return user;
  }

  public async find(
    options: {
      take?: number;
      skip?: number;
    },
    where?: FindOneOptions<User>,
  ): Promise<User[]> {
    return this.userRepository.find({
      ...options,
      ...where,
    });
  }

  public async updateRole(id: number, role: Role): Promise<Profile> {
    const user = await this.findOne({ where: { id } });

    user.role = role;

    await this.userRepository.save(user, { listeners: false });

    delete user.password;

    return user;
  }

  public async enrollInCourse(id: number, course: Course): Promise<void> {
    const user = await this.findOne({
      where: { id },
    });

    (await user.enrolledCourses).push(course);

    this.userRepository.save(user, { listeners: false });
  }

  public async getEnrolledCourses(id: number) {
    const user = await this.findOne({
      where: { id },
    });

    const courses = await user.enrolledCourses;

    return courses;
  }
}
