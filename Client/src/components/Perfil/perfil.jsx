import fotoperfil from '../../assets/cont.svg'
import React from 'react';
export default function Perfil() {

  return (
    <>
      <nav className="">
        <div className="w-full mx-auto my-0 p-3 justify-between">
          <div className="w-full mx-auto my-0 p-3 justify-between">

          <button
              className="" type="button"><i className=""><img src={fotoperfil} alt="" /></i>
            </button>

          </div>
          <div id="example-navbar-danger">
                <h1>CONTAINER</h1>
                <p>Plantação de:</p>
                <p>Ativo desde:</p>
                <p>DATA</p>            
          </div>       
        </div>
      </nav>
    </>


  );
}