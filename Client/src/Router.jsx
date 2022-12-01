import {BrowserRouter, Routes, Route} from 'react-router-dom';
import Home from './view/home/index';
import Container from './view/container/container';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Home/>}/>
        <Route path='/container' element={<Container/>}/>
      </Routes>
    </BrowserRouter>
  );
}
export default Router;