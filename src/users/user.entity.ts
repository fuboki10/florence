import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { IsEmail, IsNotEmpty, Length } from 'class-validator';
import * as bcrypt from 'bcryptjs';
import { Course } from 'src/courses/course.entity';

export enum Role {
  Admin = 'admin',
  Learner = 'learner',
  Instructor = 'instructor',
}

@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  @Length(6, 30, {
    message:
      'The password must be at least 6 but not longer than 30 characters',
  })
  @IsNotEmpty({ message: 'The password is required' })
  password: string;

  @Column()
  @IsNotEmpty({ message: 'The firstName is required' })
  firstName: string;

  @Column()
  @IsNotEmpty({ message: 'The lastName is required' })
  lastName: string;

  @Column({
    type: 'date',
  })
  @IsNotEmpty({ message: 'The birthdate is required' })
  birthDate: Date;

  @Column({ unique: true })
  @IsEmail({}, { message: 'Incorrect email' })
  @IsNotEmpty({ message: 'The email is required' })
  email: string;

  @Column({ default: Role.Learner })
  role: Role;

  @ManyToOne((type) => Course, (course) => course.instructor)
  createdCourses: Course[];

  constructor(data: Partial<User> = {}) {
    Object.assign(this, data);
  }

  @BeforeInsert()
  @BeforeUpdate()
  async hashPassword(): Promise<void> {
    const salt = await bcrypt.genSalt();
    this.password = await bcrypt.hash(this.password, salt);
  }

  async checkPassword(plainPassword: string): Promise<boolean> {
    return await bcrypt.compare(plainPassword, this.password);
  }
}
