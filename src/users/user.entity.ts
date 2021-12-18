import {
  AfterLoad,
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  Index,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { Course } from '../courses/course.entity';
import { Role } from './role.enum';
import { Thread } from '../threads/thread.entity';

@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({ select: false })
  password: string;

  @Column()
  firstName: string;

  @Column()
  lastName: string;

  @Column({
    type: 'date',
  })
  birthDate: Date;

  @Column({ unique: true })
  email: string;

  @Column({ default: Role.Learner })
  @Index()
  role: Role;

  @ManyToOne((type) => Course, (course) => course.instructor)
  createdCourses: Course[];

  @ManyToMany(() => Course, (course) => course.students)
  @JoinTable()
  enrolledCourses: Promise<Course[]>;

  @OneToMany(() => Thread, (thread) => thread.user)
  replies: Thread[];

  public name: string;

  constructor(data: Partial<User> = {}) {
    Object.assign(this, data);
  }

  @BeforeInsert()
  @BeforeUpdate()
  async hashPassword(): Promise<void> {
    const salt = await bcrypt.genSalt();
    this.password = await bcrypt.hash(this.password, salt);
  }

  @AfterLoad()
  getName() {
    this.name = this.firstName + ' ' + this.lastName;
  }

  async checkPassword(plainPassword: string): Promise<boolean> {
    return await bcrypt.compare(plainPassword, this.password);
  }
}
