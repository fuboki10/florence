import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { IsNotEmpty } from 'class-validator';
import { Lesson } from '../lessons/lesson.entity';

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

  @OneToMany((type) => Lesson, (lesson) => lesson.course)
  lessons: Lesson[];

  constructor(data: Partial<Course> = {}) {
    Object.assign(this, data);
  }
}
