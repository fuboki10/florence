import { MigrationInterface, QueryRunner } from 'typeorm';

export class LessonMigration1640103229021 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "lessons" ("id" SERIAL NOT NULL, "title" character varying NOT NULL, "description" character varying NOT NULL, "url" character varying NOT NULL, "course_id" integer NOT NULL, CONSTRAINT "PK_9b9a8d455cac672d262d7275730" PRIMARY KEY ("id"))`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "lessons"`);
  }
}
