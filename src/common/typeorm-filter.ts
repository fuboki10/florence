import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpStatus,
} from '@nestjs/common';
import { QueryFailedError } from 'typeorm';
import { Response } from 'express';

@Catch(QueryFailedError)
export class QueryFailedExceptionFilter implements ExceptionFilter {
  catch(exception: QueryFailedError, host: ArgumentsHost) {
    const context = host.switchToHttp();
    const response = context.getResponse<Response>();
    const { detail } = exception.driverError;
    const key = new RegExp(/[^\(]+(?=\))/g).exec(detail)[0];
    const errors = {};
    errors[key] = detail.split('=')[1].replace('(', '').replace(')', '');

    const errorResponse = {
      status: HttpStatus.BAD_REQUEST,
      message: 'Input data validation failed',
      errors,
    };

    response.status(HttpStatus.BAD_REQUEST).json(errorResponse);
  }
}
