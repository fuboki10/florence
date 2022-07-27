import { MigrationInterface, QueryRunner } from 'typeorm';

export class init1639770127470 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createDatabase(process.env.DB_NAME, true);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropDatabase(process.env.DB_NAME, true);
  }
}
