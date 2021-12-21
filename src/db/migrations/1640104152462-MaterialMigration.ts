import { MigrationInterface, QueryRunner } from 'typeorm';

export class MaterialMigration1640104152462 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`CREATE TABLE "materials" (
            id SERIAL PRIMARY KEY,
            title character varying NOT NULL,
            url character varying NOT NULL,
            course_id integer NOT NULL
        );`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "materials";`);
  }
}
