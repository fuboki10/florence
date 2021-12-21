import { IsNotEmpty, IsOptional, IsUrl } from 'class-validator';
import { Factory } from 'nestjs-seeder';
import { Course } from '../courses/course.entity';
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
  @Factory((faker: Faker.FakerStatic) => faker.name.title())
  title: string;

  @Column({ nullable: true })
  @IsOptional()
  @IsUrl()
  @Factory('https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf')
  url: string;

  @Column()
  @IsNotEmpty({ message: 'Course is required' })
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.number({ max: 50, min: 1 }),
  )
  courseId: number;

  @ManyToOne(() => Course, (course) => course.materials, { cascade: true })
  @JoinColumn({ name: 'courseId' })
  course: Course;

  constructor(data: Partial<Material> = {}) {
    Object.assign(this, data);
  }
}
