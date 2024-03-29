import { faker } from '@faker-js/faker'
import { createMultipleElements } from '@utils/helpers/create-multiple-elements'

describe('createMultipleElements function', () => {
  it('should create a random number of elements with all the same text', () => {
    const randomNumberOfElements = faker.number.int({ min: 1, max: 10 })
    const randomText = faker.lorem.text()
    const elements = createMultipleElements(randomNumberOfElements, () => randomText)
    expect(elements.length).toBe(randomNumberOfElements)
    expect(elements.every((element) => element === randomText)).toBe(true)
  })
})
