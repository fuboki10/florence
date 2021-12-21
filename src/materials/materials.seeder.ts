import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { Repository } from 'typeorm';
import { Material } from './material.entity';

@Injectable()
export class MaterialsSeeder implements Seeder {
  constructor(
    @InjectRepository(Material) private readonly material: Repository<Material>,
  ) {}

  async seed(): Promise<any> {
    // Generate 100 Materials.
    const materials = DataFactory.createForClass(Material).generate(100);

    // Insert into the database.
    return this.material.save(
      materials.map((material) => new Material(material)),
    );
  }

  async drop(): Promise<any> {
    return this.material.delete({});
  }
}
