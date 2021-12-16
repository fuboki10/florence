import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { IsNotEmpty } from 'class-validator';

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

  constructor(data: Partial<Course> = {}) {
    Object.assign(this, data);
  }
}
