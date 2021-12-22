import {
  BadRequestException,
  Body,
  Controller,
  Param,
  Post,
  Req,
  UploadedFile,
  UseGuards,
  UseInterceptors,
  UsePipes,
  Version,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import {
  editFileName,
  FindOneParams,
  pdfFileFilter,
  uploadFile,
  ValidationPipe,
} from '../common';
import { JwtAuthGuard } from '../auth/jwt';
import { RolesGuard } from '../auth/roles.guard';
import { Role } from '../users/role.enum';
import { MaterialDto, CreateMaterialDto } from './material.dto';
import { MaterialsService } from './materials.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';

@Controller('materials')
@ApiTags('materials')
@UsePipes(new ValidationPipe())
export class MaterialsController {
  constructor(private readonly materialsService: MaterialsService) {}

  @Version('1')
  @ApiResponse({ type: MaterialDto })
  @ApiBody({ type: CreateMaterialDto })
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Instructor, Role.Admin]))
  @ApiBearerAuth()
  @Post()
  public async createMaterial(
    @Body() material: CreateMaterialDto,
  ): Promise<MaterialDto> {
    return this.materialsService.create(material);
  }

  @Version('1')
  @UseGuards(JwtAuthGuard, new RolesGuard([Role.Admin, Role.Instructor]))
  @ApiBearerAuth()
  @ApiConsumes('multipart/form-data')
  @uploadFile('pdf')
  @ApiResponse({ type: MaterialDto })
  @UseInterceptors(
    FileInterceptor('pdf', {
      storage: diskStorage({
        destination: './files',
        filename: editFileName,
      }),
      fileFilter: pdfFileFilter,
    }),
  )
  @Post(':id/pdf')
  public async uploadPdf(
    @Req() req,
    @UploadedFile() file: Express.Multer.File,
    @Param() params: FindOneParams,
  ): Promise<MaterialDto> {
    if (!file || req.fileValidationError) {
      throw new BadRequestException(
        'Invalid File Provided, [pdf files allowed]',
      );
    }

    return this.materialsService.updateUrl(
      params.id,
      'http://' + req.headers.host + '/api/' + file.path,
    );
  }
}
