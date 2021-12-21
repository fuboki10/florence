import { MigrationInterface, QueryRunner } from 'typeorm';

export class UserEnrolledMigration1640113080835 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "users_enrolled_courses_courses" ("usersId" integer NOT NULL, "coursesId" integer NOT NULL, CONSTRAINT "PK_e3d32fea11d21d8f989c9f09a4f" PRIMARY KEY ("usersId", "coursesId"))`,
    );

    await queryRunner.query(
      `CREATE INDEX "IDX_0f7205cda4e64d225dab1abe22" ON "users_enrolled_courses_courses" ("usersId") `,
    );

    await queryRunner.query(
      `CREATE INDEX "IDX_2355d163861f052a74acb4db15" ON "users_enrolled_courses_courses" ("coursesId") `,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE "users_enrolled_courses_courses"`);
  }
}
