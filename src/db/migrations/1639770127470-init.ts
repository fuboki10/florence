import { MigrationInterface, QueryRunner } from 'typeorm';

export class init1639770127470 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createDatabase('florence', true);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropDatabase('florence', true);
  }
}
