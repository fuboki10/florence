export enum Role {
  Admin = 'admin',
  Learner = 'learner',
  Instructor = 'instructor',
}

/**
 * Helper to produce an array of enum values.
 * @param enumeration Enumeration object.
 */
export function enumToArray<T>(enumeration: T): T[] {
  return Object.keys(enumeration)
    .filter((key) => isNaN(Number(key)))
    .map((key) => enumeration[key])
    .filter((val) => typeof val === 'number' || typeof val === 'string');
}
