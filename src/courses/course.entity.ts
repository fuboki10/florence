import {
  Column,
  Entity,
  JoinColumn,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { IsNotEmpty } from 'class-validator';
import { Lesson } from '../lessons/lesson.entity';
import { User } from '../users/user.entity';

@Entity({ name: 'courses' })
export class Course {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsNotEmpty({ message: 'Title is required' })
  title: string;

  @Column()
  @IsNotEmpty({ message: 'Description is required' })
  description: string;

  @Column()
  @IsNotEmpty({ message: 'Category is required' })
  category: string;

  @Column()
  @IsNotEmpty({ message: 'Instructor is required' })
  instructor_id: string;

  @OneToMany((type) => Lesson, (lesson) => lesson.course)
  lessons: Lesson[];

  @OneToMany((type) => User, (instructor) => instructor.createdCourses)
  @JoinColumn({ name: 'instructor_id' })
  instructor: User;

  constructor(data: Partial<Course> = {}) {
    Object.assign(this, data);
  }
}
