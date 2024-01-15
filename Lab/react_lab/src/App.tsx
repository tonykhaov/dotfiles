import { Routes, Route, Link, useLocation } from 'react-router-dom'
import Homepage from '@pages/homepage'
import About from '@pages/about'
import Fetch from '@pages/fetch'
import { css } from 'styled-system/css'

function App() {
  return (
    <>
      <NavBar />
      <div
        className={css({
          display: 'flex',
          minHeight: '45vh',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
        })}
      >
        <Routes>
          <Route path="/" element={<Homepage />} />
          <Route path="/about" element={<About />} />
          <Route path="/fetch" element={<Fetch />} />
        </Routes>
      </div>
    </>
  )
}

function NavBar() {
  const { pathname } = useLocation()
  return (
    <nav
      className={css({
        borderWidth: '2',
        py: '4',
      })}
    >
      <ul
        className={css({
          display: 'flex',
          justifyContent: 'center',
          gap: {
            base: '2',
            md: '8',
          },
        })}
      >
        <li>
          <NavLink to="/" data-active={pathname === '/'}>
            Go to homepage
          </NavLink>
        </li>
        <li>
          <NavLink to="/about" data-active={pathname === '/about'}>
            Go to about
          </NavLink>
        </li>
        <li>
          <NavLink to="/fetch" data-active={pathname === '/fetch'}>
            Go to fetch
          </NavLink>
        </li>
      </ul>
    </nav>
  )
}

function NavLink(props: React.ComponentProps<typeof Link>) {
  return (
    <Link
      {...props}
      className={css({
        'p': '2',
        '&:hover': {
          color: 'blue.500',
        },
        '&[data-active=true]': {
          borderWidth: '4',
          borderColor: 'blue.400',
          color: 'blue.700',
        },
      })}
    />
  )
}

export default App
