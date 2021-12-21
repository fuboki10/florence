import { MigrationInterface, QueryRunner } from 'typeorm';

export class init1639770127470 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      'DROP DATABASE IF EXISTS florence; CREATE DATABASE florence;',
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DROP DATABASE IF EXISTS florence;');
  }
}
