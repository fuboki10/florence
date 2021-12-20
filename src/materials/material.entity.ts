import { IsNotEmpty, IsOptional, IsUrl } from 'class-validator';
import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'materials' })
export class Material {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  @IsNotEmpty({ message: 'Title is required' })
  title: string;

  @Column({ nullable: true })
  @IsOptional()
  @IsUrl()
  url: string;

  constructor(data: Partial<Material> = {}) {
    Object.assign(this, data);
  }
}
