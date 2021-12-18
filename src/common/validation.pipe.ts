import {
  PipeTransform,
  ArgumentMetadata,
  BadRequestException,
  HttpStatus,
  Injectable,
} from '@nestjs/common';
import { validate } from 'class-validator';
import { plainToClass } from 'class-transformer';
import { HttpException } from '@nestjs/common/exceptions/http.exception';

@Injectable()
export class ValidationPipe implements PipeTransform<any> {
  async transform(value, metadata: ArgumentMetadata) {
    if (!value) {
      throw new BadRequestException('No data submitted');
    }

    const { metatype } = metadata;
    if (!metatype || !this.toValidate(metatype)) {
      return value;
    }

    const object = plainToClass(metatype, value, {
      excludeExtraneousValues: true,
      exposeDefaultValues: true,
    });

    const errors = await validate(object);
    if (errors.length > 0) {
      throw new HttpException(
        {
          status: HttpStatus.BAD_REQUEST,
          message: 'Input data validation failed',
          errors: this.buildError(errors),
        },
        HttpStatus.BAD_REQUEST,
      );
    }
    return object;
  }

  private buildError(errors) {
    const result = {};
    errors.forEach((el) => {
      const prop = el.property;

      const constraints = el.constraints ? el.constraints : el.children;

      Object.entries(constraints).forEach((constraint) => {
        result[prop] = `${constraint[1]}`;
      });
    });

    return result;
  }

  private toValidate(metatype): boolean {
    const types = [String, Boolean, Number, Array, Object];
    return !types.find((type) => metatype === type);
  }
}
