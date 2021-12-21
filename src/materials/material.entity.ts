import { IsNotEmpty, IsOptional, IsUrl } from 'class-validator';
import { Course } from 'src/courses/course.entity';
import { User } from 'src/users/user.entity';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity({ name: 'materials' })
export class Material {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsNotEmpty({ message: 'Title is required' })
  title: string;

  @Column({ nullable: true })
  @IsOptional()
  @IsUrl()
  url: string;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  courseId: number;

  @ManyToOne(() => Course, (course) => course.materials, { cascade: true })
  @JoinColumn({ name: 'courseId' })
  course: Course;

  constructor(data: Partial<Material> = {}) {
    Object.assign(this, data);
  }
}
