import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FindOneOptions, Repository } from 'typeorm';
import { EditProfile } from './user.dto';
import { User } from './user.entity';

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

  public async update(id: string, data: EditProfile): Promise<User> {
    const user = await this.findOne({ where: { id } });

    // check if password is right
    if (!(await user.checkPassword(data.oldPassword))) {
      throw new UnauthorizedException('Invalid password!');
    }

    data.password = data.newPassword ?? data.oldPassword;

    const { newPassword, oldPassword, ...partialUser } = data;

    // update
    Object.keys(partialUser).forEach((key) => {
      user[key] = partialUser[key];
    });

    await this.userRepository.save(user);

    delete user.password;

    return user;
  }
}
