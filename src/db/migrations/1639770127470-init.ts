import { User } from 'src/users/user.entity';
import { getRepository, MigrationInterface, QueryRunner } from 'typeorm';
import { UserSeed } from '../seeds/user.seed';

export class init1639770127470 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      'DROP DATABASE IF EXISTS florence; CREATE DATABASE florence;',
    );

    const users = await getRepository<User>('users').create(
      UserSeed.map((userSeed) => new User(userSeed)),
    );

    users.forEach((user) => console.log(`Created user with ID = ${user.id}`));
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DROP DATABASE IF EXISTS florence;');
  }
}
