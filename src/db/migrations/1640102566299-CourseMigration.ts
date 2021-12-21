import { MigrationInterface, QueryRunner } from 'typeorm';

export class CourseMigration1640102566299 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "courses" ("id" SERIAL NOT NULL, "title" character varying NOT NULL, "description" character varying NOT NULL, "category" character varying NOT NULL, "instructor_id" integer NOT NULL, CONSTRAINT "PK_3f70a487cc718ad8eda4e6d58c9" PRIMARY KEY ("id"))`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "courses";`);
  }
}
