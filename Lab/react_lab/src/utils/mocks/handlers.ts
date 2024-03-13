import { faker } from '@faker-js/faker'
import { createMultipleElements } from '@utils/helpers/create-multiple-elements'
import { generateUser } from '@mocks/generate/user'
import { HttpResponse, http } from 'msw'

export const handlers = [
  http.get('https://my-backend.com/api/users', () => HttpResponse.json(createMultipleElements(faker.number.int({ min: 4, max: 6 }), generateUser)))
]
