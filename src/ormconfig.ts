import { TypeOrmModuleOptions } from '@nestjs/typeorm';

console.log(process.env);

export const pgConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: process.env.DB_HOST,
  port: parseInt(<string>process.env.DB_PORT),
  username: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: 'florence',
  entities: [__dirname + '/**/*.entity{.ts,.js}'],
  synchronize: true,
  migrations: [__dirname + '/**/*.migrations{.ts,.js}'],
  cli: { migrationsDir: 'src/db/migrations' },
};

export default pgConfig;
