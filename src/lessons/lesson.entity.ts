import { IsNotEmpty, IsUrl } from 'class-validator';
import { Course } from '../courses/course.entity';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';

@Entity({ name: 'lessons' })
export class Lesson {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsNotEmpty({ message: 'Title is required' })
  title: string;

  @Column()
  @IsNotEmpty({ message: 'Description is required' })
  description: string;

  @Column()
  @IsNotEmpty({ message: 'Url is required' })
  @IsUrl()
  url: string;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
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
