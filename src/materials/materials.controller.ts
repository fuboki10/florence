import { Body, Controller, Post, UseGuards, Version } from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/jwt';
import { RolesGuard } from '../auth/roles.guard';
import { Role } from '../users/role.enum';
import { AuthUser } from '../users/user.decorator';
import { Profile } from '../users/user.dto';
import { MaterialDto, CreateMaterialDto } from './material.dto';
import { MaterialsService } from './materials.service';

@Controller('materials')
@ApiTags('materials')
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
}
