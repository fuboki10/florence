import { ApiProperty } from '@nestjs/swagger';
import { Expose } from 'class-transformer';
import { IsInt, IsString, IsUrl } from 'class-validator';

export class CreateMaterialDto {
  @ApiProperty()
  @Expose()
  @IsString()
  readonly title: string;

  @ApiProperty()
  @Expose()
  @IsInt()
  readonly courseId: number;
}

export class MaterialDto {
  @ApiProperty()
  @Expose()
  readonly id: number;

  @ApiProperty()
  @Expose()
  @IsString()
  readonly title: string;

  @ApiProperty()
  @Expose()
  @IsUrl()
  readonly url: string;

  @ApiProperty()
  @Expose()
  @IsInt()
  readonly courseId: number;
}
