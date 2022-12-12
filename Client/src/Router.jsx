import {BrowserRouter, Routes, Route} from 'react-router-dom';
import Home from './view/home/index';
import ContainerF from './view/container/Func/containerFuncionalidades';
import ContainerG from './view/container/Geren/containerGerenciamento';

function Router() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Home/>}/>
        <Route path='/container-funcionalidades' element={<ContainerF/>}/>
        <Route path='/container-gerenciamento' element={<ContainerG/>}/>
      </Routes>
    </BrowserRouter>
  );
}
export default Router;