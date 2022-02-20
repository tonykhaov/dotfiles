import type { MetaFunction, LoaderFunction } from 'remix'
import { useLoaderData, json } from 'remix'
import fs from 'fs/promises'
import path from 'path'
import os from 'os'

function getLocalIpAddress() {
  return os.networkInterfaces().en0?.[1].address
}

export let loader: LoaderFunction = async () => {
  const pathToPublicDir = path.join(path.dirname(__dirname), 'public')
  const files = await fs.readdir(pathToPublicDir)
  const ignoredFiles = ['build', 'favicon.ico', '.DS_Store']
  const uploadedFiles = files.filter((file) => !ignoredFiles.includes(file))
  console.log(
    'access your files from another device:',
    '\x1b[41m', // beginning of red background
    `https://${getLocalIpAddress()}:3000`,
    '\x1b[0m', // end of red background
  )
  return json(uploadedFiles)
}

// https://remix.run/api/conventions#meta
export let meta: MetaFunction = () => {
  return {
    title: 'Remix Starter',
    description: 'Welcome to remix!',
  }
}

// https://remix.run/guides/routing#index-routes
export default function Index() {
  let data = useLoaderData<string[]>()
  return (
    <div>
      <h1>Remix Starter</h1>
      <ul>
        {data.map((file) => {
          return (
            <li key={file}>
              <a href={'/' + file} target="_blank">
                {file}
              </a>
            </li>
          )
        })}
      </ul>
    </div>
  )
}
