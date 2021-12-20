import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { join } from 'path';
import { deleteFileIfExists } from 'src/common';
import { FindOneOptions, Repository } from 'typeorm';
import { Material } from './material.entity';

@Injectable()
export class MaterialsService {
  constructor(
    @InjectRepository(Material)
    private readonly materialRepository: Repository<Material>,
  ) {}

  public async create(data: Partial<Material>): Promise<Material> {
    return this.materialRepository.save(new Material(data));
  }

  public async findOne(where: FindOneOptions<Material>): Promise<Material> {
    const material = await this.materialRepository.findOne(where);

    if (!material) {
      throw new NotFoundException('material is not Found!');
    }

    return material;
  }

  public async find(
    options: {
      take?: number;
      skip?: number;
    },
    where?: FindOneOptions<Material>,
  ): Promise<Material[]> {
    return this.materialRepository.find({
      ...options,
      ...where,
    });
  }

  public async updateUrl(id: number, url: string): Promise<Material> {
    const material = await this.findOne({ where: { id } });

    if (material.url) {
      const parameters = material.url.split('/');
      const path = join(
        __dirname,
        '/../../',
        parameters[parameters.length - 2],
        parameters[parameters.length - 1],
      );
      await deleteFileIfExists(path);
    }

    material.url = url;

    await this.materialRepository.save(material);

    return material;
  }
}
