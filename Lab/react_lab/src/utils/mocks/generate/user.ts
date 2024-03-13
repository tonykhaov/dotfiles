import { faker } from '@faker-js/faker'
import type { User } from '@src/types/user'

function generateUser(): User {
  return {
    id: faker.string.uuid(),
    name: faker.person.fullName(),
    email: faker.internet.email(),
    password: faker.internet.password(),
  }
}

export { generateUser }
