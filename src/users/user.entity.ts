import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { IsEmail, IsNotEmpty, Length } from 'class-validator';

@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ select: false })
  @Length(6, 30, {
    message:
      'The password must be at least 6 but not longer than 30 characters',
  })
  @IsNotEmpty({ message: 'The password is required' })
  password: string;

  @Column()
  @IsNotEmpty({ message: 'The firstname is required' })
  firstName: string;

  @Column()
  @IsNotEmpty({ message: 'The lastname is required' })
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
}
