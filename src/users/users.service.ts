import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PasswordInvalidException } from '../common';
import { FindOneOptions, Repository } from 'typeorm';
import { EditProfile, Profile } from './user.dto';
import { User } from './user.entity';
import { Role } from './role.enum';

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
    const user = await this.userRepository.findOne(where);

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
}
