import fs from 'fs/promises'

export default async function handler(req, res) {
  const publicFiles = await fs.readdir('./public')
  const filesToIgnore = ['favicon.ico', 'vercel.svg']
  const files = publicFiles.filter((f) => !filesToIgnore.includes(f))
  return res.status(200).json(files)
}
