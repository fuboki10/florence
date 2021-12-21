import {
  Column,
  Entity,
  JoinColumn,
  ManyToMany,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { IsNotEmpty } from 'class-validator';
import { Lesson } from '../lessons/lesson.entity';
import { User } from '../users/user.entity';
import { Thread } from '../threads/thread.entity';
import { Material } from '../materials/material.entity';
import { Factory } from 'nestjs-seeder';

@Entity({ name: 'courses' })
export class Course {
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
  @IsNotEmpty({ message: 'Category is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.arrayElement([
      'frameworks',
      'languages',
      'techniques',
      'testing',
      'tooling',
    ]),
  )
  category: string;

  @Column()
  @IsNotEmpty({ message: 'Instructor is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.number({ max: 10, min: 1 }),
  )
  instructor_id: number;

  @OneToMany((type) => Lesson, (lesson) => lesson.course)
  lessons: Lesson[];

  @ManyToOne((type) => User, (instructor) => instructor.createdCourses)
  @JoinColumn({ name: 'instructor_id' })
  instructor: User;

  @ManyToMany(() => User, (user) => user.enrolledCourses)
  students: Promise<User[]>;

  @OneToMany(() => Thread, (thread) => thread.course)
  threads: Thread[];

  @OneToMany(() => Material, (material) => material.course)
  materials: Material[];

  constructor(data: Partial<Course> = {}) {
    Object.assign(this, data);
  }
}
