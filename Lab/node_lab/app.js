function ser(val) {
  return JSON.stringify(val, null, 4)
}

const user = {
  name: 'f',
  p: 'd',
}

const json = ser(user)

console.log(json)
