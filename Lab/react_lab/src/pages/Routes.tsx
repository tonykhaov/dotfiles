import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import About from './About'
import Home from './Home'

function Routes() {
  return (
    <Router>
      <Switch>
        <Route path="/about">
          <About />
        </Route>
        <Route path="/">
          <Home />
        </Route>
      </Switch>
    </Router>
  )
}

export default Routes
