import { IsNotEmpty } from 'class-validator';
import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'libraries' })
export class Library {
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
  @IsNotEmpty({ message: 'Percentage is required' })
  percentage: number;

  @Column()
  @IsNotEmpty({ message: 'Lessons is required' })
  lessons: number;
}
