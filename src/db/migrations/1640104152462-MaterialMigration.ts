import { MigrationInterface, QueryRunner } from 'typeorm';

export class MaterialMigration1640104152462 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "materials" ("id" SERIAL NOT NULL, "title" character varying NOT NULL, "url" character varying, "courseId" integer NOT NULL, CONSTRAINT "PK_2fd1a93ecb222a28bef28663fa0" PRIMARY KEY ("id"))`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "materials";`);
  }
}
