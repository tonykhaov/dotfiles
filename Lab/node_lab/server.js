import Fastify from 'fastify'
const fastify = Fastify({
  logger: true,
})

fastify.get('/', (request, reply) => reply.send({ hello: 'world' }))

// Run the server!
fastify.listen(3000, (err, address) => {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  console.log(`Server is now listening on ${address}`)
})
