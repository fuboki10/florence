import { IsNotEmpty, IsUrl } from 'class-validator';
import { Course } from '../courses/course.entity';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { Factory } from 'nestjs-seeder';

@Entity({ name: 'lessons' })
export class Lesson {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsNotEmpty({ message: 'Title is required' })
  @Factory((faker: Faker.FakerStatic) => faker.name.title())
  title: string;

  @Column()
  @IsNotEmpty({ message: 'Description is required' })
  @Factory((faker: Faker.FakerStatic) => faker.name.jobDescriptor())
  description: string;

  @Column()
  @IsNotEmpty({ message: 'Url is required' })
  @IsUrl()
  @Factory('https://www.youtube.com/watch?v=PQZhN65vq9E')
  url: string;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.number({ max: 50, min: 1 }),
  )
  course_id: number;

  @ManyToOne((type) => Course, (course) => course.lessons, {
    onDelete: 'CASCADE',
    primary: true,
  })
  @JoinColumn({ name: 'course_id' })
  course: Course;

  constructor(data: Partial<Lesson> = {}) {
    Object.assign(this, data);
  }
}
