import { GetServerSideProps } from 'next'

type HomeProps = {
  files: Array<string>
}

export default function Home(props: HomeProps) {
  return (
    <div>
      <h1>HELLO NEXT LAB</h1>
      <div className="text-center">
        <h3>I found these files in public folder. You can download them:</h3>
        <ul className="list-disc">
          {props.files.length <= 0 ? (
            <p>No file found, add a file to `./public`</p>
          ) : (
            props.files.map((file) => (
              <li className="" key={file}>
                <a
                  className="text-blue-600 hover:text-blue-500 visited:text-purple-800 visited:hover:text-purple-800"
                  href={file}
                >
                  {file}
                </a>
              </li>
            ))
          )}
        </ul>
      </div>
    </div>
  )
}

export const getServerSideProps: GetServerSideProps<HomeProps> = async () => {
  const res = await fetch('http://localhost:3000/api/files')
  const files = await res.json()
  return {
    props: { files },
  }
}
