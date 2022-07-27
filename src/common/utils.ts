import { Request } from 'express';
import { existsSync, unlinkSync } from 'fs';

export async function deleteFileIfExists(path: string) {
  if (existsSync(path)) unlinkSync(path);
}

export function getUrlFromRequest(req: Request) {
  return `${req.protocol}://${req.get('host')}/api/`;
}
