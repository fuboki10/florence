import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { MockType, repositoryMockFactory } from 'src/utils';
import { Repository } from 'typeorm';
import { User } from './user.entity';
import { UsersService } from './users.service';

export async function createUserTestingModule(): Promise<TestingModule> {
  return Test.createTestingModule({
    providers: [
      UsersService,
      // Provide your mock instead of the actual repository
      {
        provide: getRepositoryToken(User),
        useFactory: repositoryMockFactory,
      },
    ],
  }).compile();
}

describe('UsersService', () => {
  let service: UsersService;
  let repositoryMock: MockType<Repository<User>>;

  beforeEach(async () => {
    const module: TestingModule = await createUserTestingModule();

    service = module.get<UsersService>(UsersService);
    repositoryMock = module.get(getRepositoryToken(User));
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
