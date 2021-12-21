import { MigrationInterface, QueryRunner } from 'typeorm';

export class UserMigration1640044327559 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`CREATE TABLE "users" (
        id integer NOT NULL,
        password character varying NOT NULL,
        "firstName" character varying NOT NULL,
        "lastName" character varying NOT NULL,
        "birthDate" date NOT NULL,
        email character varying NOT NULL,
        role character varying DEFAULT 'learner'::character varying NOT NULL,
        avatar character varying
    );`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "users"`);
  }
}
