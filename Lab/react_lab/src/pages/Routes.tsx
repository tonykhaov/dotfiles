import { Routes, Route, BrowserRouter, Link } from 'react-router-dom'
import About from './About'
import Home from './Home'

function MyRoutes() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/about" element={<About />} />
        <Route path="/" element={<Home />} />
      </Routes>
      <Links />
    </BrowserRouter>
  )
}

function Links() {
  return (
    <ul>
      <li>
        <Link to="/">Go to homepage</Link>
      </li>
      <li>
        <Link to="/about">Go to about</Link>
      </li>
    </ul>
  )
}

export default MyRoutes
