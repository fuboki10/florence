import { MigrationInterface, QueryRunner } from 'typeorm';

export class CourseMigration1640102566299 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`CREATE TABLE courses (
            id Serial PRIMARY KEY,
            title character varying NOT NULL,
            description character varying NOT NULL,
            category character varying NOT NULL,
            instructor_id integer NOT NULL
        );`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "courses";`);
  }
}
