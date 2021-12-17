import {
  ArgumentsHost,
  BadRequestException,
  Catch,
  ExceptionFilter,
  HttpStatus,
} from '@nestjs/common';

import { Response } from 'express';

export class PasswordInvalidException extends BadRequestException {
  constructor() {
    super('The password was invalid');
  }
}

@Catch(PasswordInvalidException)
export class PasswordInvalidExceptionFilter implements ExceptionFilter {
  catch(exception: PasswordInvalidException, host: ArgumentsHost) {
    const context = host.switchToHttp();
    const response = context.getResponse<Response>();
    const key = 'password';
    const errors = {};
    errors[key] = exception.message;

    const errorResponse = {
      status: HttpStatus.BAD_REQUEST,
      message: 'Input data validation failed',
      errors,
    };

    response.status(HttpStatus.BAD_REQUEST).json(errorResponse);
  }
}
