import { Logger, VersioningType } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

import { AppModule } from './app.module';
import { QueryFailedExceptionFilter } from './common';

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
  app.useGlobalFilters(new QueryFailedExceptionFilter());

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
  const port = process.env.PORT ?? 3000;
  await app.listen(port);
  Logger.log(
    `🚀 Application is running on: http://localhost:${port}/${globalPrefix}`,
  );
}

bootstrap();
