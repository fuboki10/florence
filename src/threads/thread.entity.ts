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

@Entity({ name: 'threads', orderBy: { date: 'ASC', time: 'ASC' } })
export class Thread {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsString()
  @IsNotEmpty({ message: 'Text is required' })
  @Factory((faker: Faker.FakerStatic) => faker.random.words(3))
  text: string;

  @Column()
  @IsDateString()
  @IsNotEmpty({ message: 'Date is required' })
  @Factory((faker: Faker.FakerStatic) => faker.date.past(1))
  date: string;

  @Column()
  @IsMilitaryTime()
  @IsNotEmpty({ message: 'Time is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.date.recent().toISOString().substr(11, 5),
  )
  time: string;

  @Column()
  @IsNotEmpty({ message: 'User is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.number({ max: 10, min: 1 }),
  )
  userId: number;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.number({ max: 50, min: 1 }),
  )
  courseId: number;

  @ManyToOne(() => User, (user) => user.replies, { cascade: true, eager: true })
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
