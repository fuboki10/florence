import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Role } from '../users/role.enum';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private roles: Role[]) {}

  public canActivate(context: ExecutionContext): boolean {
    if (!this.roles) {
      return true;
    }
    const { user } = context.switchToHttp().getRequest();
    return this.roles.some((role) => user.role === role);
  }
}
