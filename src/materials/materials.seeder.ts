import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Seeder, DataFactory } from 'nestjs-seeder';
import { writeFile } from 'promise-fs';
import { Repository } from 'typeorm';
import { Material } from './material.entity';

@Injectable()
export class MaterialsSeeder implements Seeder {
  constructor(
    @InjectRepository(Material) private readonly material: Repository<Material>,
  ) {}

  async seed(): Promise<any> {
    const materialsNumber = 1000000;
    // Generate 100 Materials.
    const materials = DataFactory.createForClass(Material)
      .generate(materialsNumber)
      .map((material) => new Material(material));

    // Insert into the database.
    return writeFile('materials.json', JSON.stringify(materials));
    return this.material.save(materials);
  }

  async drop(): Promise<any> {
    return this.material.delete({});
  }
}
