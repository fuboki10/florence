import { MigrationInterface, QueryRunner } from 'typeorm';

export class ThreadMigration1640112993615 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "threads" ("id" SERIAL NOT NULL, "text" character varying NOT NULL, "date" character varying NOT NULL, "time" character varying NOT NULL, "userId" integer NOT NULL, "courseId" integer NOT NULL, "parentId" integer, CONSTRAINT "PK_d8a74804c34fc3900502cd27275" PRIMARY KEY ("id"))`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "threads`);
  }
}
