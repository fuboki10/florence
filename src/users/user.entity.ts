import {
  AfterLoad,
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  Index,
  JoinTable,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { Course } from '../courses/course.entity';
import { enumToArray, Role } from './role.enum';
import { Thread } from '../threads/thread.entity';
import { IsOptional, IsUrl } from 'class-validator';
import { Factory } from 'nestjs-seeder';
import * as faker from 'faker';
@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({ select: false })
  @Factory('123123')
  password: string;

  @Column()
  @Factory((faker: Faker.FakerStatic) => faker.name.firstName())
  firstName: string;

  @Column()
  @Factory((faker: Faker.FakerStatic) => faker.name.lastName())
  lastName: string;

  @Column({
    type: 'date',
  })
  @Factory((faker: Faker.FakerStatic) => faker.date.past(20))
  birthDate: Date;

  @Column({ unique: true })
  @Factory(faker.unique(() => faker.internet.email()))
  email: string;

  @Column({ default: Role.Learner })
  @Index()
  @Factory((faker: Faker.FakerStatic) =>
    faker.random.arrayElement(enumToArray(Role)),
  )
  role: Role;

  @Column({
    nullable: true,
    default: 'http://localhost:3000/api/files/default.png',
  })
  @IsOptional()
  @IsUrl()
  avatar: string;

  @OneToMany((type) => Course, (course) => course.instructor)
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
