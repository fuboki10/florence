import { existsSync, unlinkSync } from 'fs';

export async function deleteFileIfExists(path: string) {
  if (existsSync(path)) unlinkSync(path);
}
