import hamburgericon from '../../assets/Vector.svg';
import perfil from '../../assets/Perfil.svg';
import { Link } from "react-router-dom";
import React from 'react';
export default function NavBar() {

  return (
    <>
      <nav className="">
        <div className="w-full mx-auto my-0 p-3 justify-between">
          <div className="w-full mx-auto my-0 p-3 justify-between">

          <button
              className="" type="button"><i className=""><img src={perfil} alt="" /></i>
            </button>

            <button
              className="" type="button">
              <i ><img src={hamburgericon} alt="" /></i>
            </button>
          </div>
          <div
            id="example-navbar-danger"
          >
            <ul className="">
              <li className="">
                <i className=""></i><Link to="/" className="ml-2 text-black">Container</Link>
              </li>
            </ul>
          </div>       
        </div>
            <h1 className="">Bem vindo de volta, João!</h1>
      </nav>
    </>


  );
}