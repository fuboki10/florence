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
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Course } from '../courses/course.entity';

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

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  courseId: number;

  @ManyToOne(() => User, (user) => user.replies, { cascade: true })
  @JoinColumn({ name: 'userId' })
  user: User;

  @ManyToOne(() => Course, (course) => course.threads, { cascade: true })
  @JoinColumn({ name: 'courseId' })
  course: Course;

  @ManyToOne((type) => Thread, (service) => service.replies, { nullable: true })
  parent: Thread;

  @OneToMany((type) => Thread, (Thread) => Thread.parent, {
    cascade: true,
  })
  replies: Thread[];

  constructor(data: Partial<User> = {}) {
    Object.assign(this, data);
  }
}
