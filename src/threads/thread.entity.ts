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
import { Factory } from 'nestjs-seeder';

@Entity({ name: 'threads' })
export class Thread {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsString()
  @IsNotEmpty({ message: 'Text is required' })
  @Factory((faker: Faker.FakerStatic) => faker.random.words(10))
  text: string;

  @Column()
  @IsDateString()
  @IsNotEmpty({ message: 'Date is required' })
  @Factory((faker: Faker.FakerStatic) => faker.date.past(1))
  date: string;

  @Column()
  @IsMilitaryTime()
  @IsNotEmpty({ message: 'Time is required' })
  @Factory((faker: Faker.FakerStatic) => faker.time.recent())
  time: string;

  @Column()
  @IsNotEmpty({ message: 'User is required' })
  @Factory((faker: Faker.FakerStatic) => faker.datatype.number(10))
  userId: number;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  @Factory((faker: Faker.FakerStatic) => faker.datatype.number(50))
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
