import {
  IsDateString,
  IsMilitaryTime,
  IsNotEmpty,
  IsString,
} from 'class-validator';
import { User } from '../users/user.entity';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity({ name: 'threads' })
export class Thread {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsString()
  @IsNotEmpty({ message: 'Text is required' })
  text: string;

  @Column()
  @IsDateString()
  @IsNotEmpty({ message: 'Date is required' })
  date: string;

  @Column()
  @IsMilitaryTime()
  @IsNotEmpty({ message: 'Time is required' })
  time: string;

  @Column()
  @IsNotEmpty({ message: 'User is required' })
  userId: number;

  @ManyToOne(() => User, (user) => user.replies, { cascade: true })
  @JoinColumn({ name: 'userId' })
  user: User;

  constructor(data: Partial<User> = {}) {
    Object.assign(this, data);
  }
}
