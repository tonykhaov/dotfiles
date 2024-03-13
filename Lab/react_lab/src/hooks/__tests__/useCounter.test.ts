import { act, renderHook } from '@testing-library/react'
import useCounter from '@src/hooks/useCounter'
import { faker } from '@faker-js/faker'

describe('useCounter', () => {
  it('should be able to increment and then decrement', () => {
    const randomCount = faker.number.int(100)
    const randomStep = faker.number.int(10)

    const { result } = renderHook(() => useCounter({ initialCount: randomCount, step: randomStep }))
    expect(result.current.count).toBe(randomCount)

    act(() => {
      result.current.increment()
    })
    expect(result.current.count).toBe(randomCount + randomStep)
    
    act(() => {
      result.current.decrement()
    })
    expect(result.current.count).toBe(randomCount)
  })
  
  it('should be able to decrement and then increment', () => {
    const randomCount = faker.number.int(100)
    const randomStep = faker.number.int(10)
    
    const { result } = renderHook(() => useCounter({ initialCount: randomCount, step: randomStep }))
    expect(result.current.count).toBe(randomCount)
    
    act(() => {
      result.current.decrement()
    })
    expect(result.current.count).toBe(randomCount - randomStep)
    
    act(() => {
      result.current.increment()
    })
    expect(result.current.count).toBe(randomCount)
  })
})
