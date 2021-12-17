import { SignUp } from 'src/auth/dto';
import { Role } from 'src/users/role.enum';

export const UserSeed: SignUp[] = [
  {
    email: 'ahmed@walid.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Ahmed',
    lastName: 'Walid',
    role: Role.Learner,
  },
  {
    email: 'abdelrahman@tarek.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Abdelrahman',
    lastName: 'Tarek',
    role: Role.Admin,
  },
  {
    email: 'hassan@mohammed.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Hassan',
    lastName: 'Mohammed',
    role: Role.Instructor,
  },
  {
    email: 'abdelrahman@arafat.com',
    password: '123123',
    birthDate: new Date('1999-10-19'),
    firstName: 'Abdelrahman',
    lastName: 'Arafat',
    role: Role.Admin,
  },
];
