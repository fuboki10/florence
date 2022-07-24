import { Logger, VersioningType } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

import { AppModule } from './app.module';
import {
  PasswordInvalidExceptionFilter,
  QueryFailedExceptionFilter,
} from './common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: true,
    credentials: true,
  });
  const globalPrefix = 'api';

  /** Set prefices for app url */
  app.setGlobalPrefix(globalPrefix);

  /** Set Global filters */
  app.useGlobalFilters(
    new QueryFailedExceptionFilter(),
    new PasswordInvalidExceptionFilter(),
  );

  /** Add Versioning for the app */
  app.enableVersioning({
    type: VersioningType.URI,
  });

  /** Add OpenApi support  */
  const options = new DocumentBuilder()
    .setTitle('Florence Documentation')
    .setDescription('The sample API description')
    .setVersion('1.0')
    .addBearerAuth()
    .build();
  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup('docs', app, document);

  /** Run the App */
  const port = process.env.PORT || 3000;
  const host = process.env.HOST || 'localhost';
  await app.listen(port, host);
  Logger.log(
    `🚀 Application is running on: http://${host}:${port}/${globalPrefix}`,
  );
}

bootstrap();
