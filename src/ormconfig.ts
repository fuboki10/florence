import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const pgConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: process.env.DB_HOST,
  port: parseInt(<string>process.env.DB_PORT),
  username: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  entities: [__dirname + '/**/*.entity{.ts,.js}'],
  synchronize: false,
  migrations: ['dist/db/migrations/*.js'],
  cli: { migrationsDir: 'src/db/migrations' },
};

export default pgConfig;
