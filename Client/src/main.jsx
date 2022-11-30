import React from 'react'
import ReactDOM from 'react-dom/client'
import Router from './Router.jsx'
import 'bootstrap/dist/css/bootstrap.min.css';
import Home from './view/home/index.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router />
  </React.StrictMode>
)