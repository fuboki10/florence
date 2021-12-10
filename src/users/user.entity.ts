import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { IsEmail, IsNotEmpty, Length } from 'class-validator';
import * as bcrypt from 'bcryptjs';

@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  @Length(8, 30, {
    message:
      'The password must be at least 8 but not longer than 30 characters',
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
