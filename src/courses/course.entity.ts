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
import { Thread } from 'src/threads/thread.entity';

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

  constructor(data: Partial<Course> = {}) {
    Object.assign(this, data);
  }
}
