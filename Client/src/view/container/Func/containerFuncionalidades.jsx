import React from "react";
import Perfil from "../../../components/Perfil/perfil"
import { Link } from 'react-router-dom';

function Funcionalidades() {
  return (
    <>
      <nav>
        <Perfil />
      </nav>
      <div>
        <h1>FUNCIONALIDADES</h1>
        <Link to="/container-gerenciamento" className="ml-2">GERENCIAMENTO</Link>
      </div>
    </>
  );
}
export default Funcionalidades;