import hamburgericon from '../../assets/Vector.svg';
import fotoperfil from '../../assets/Perfil.svg';
import { Link } from "react-router-dom";
import React from 'react';
export default function NavBar() {
  const [navbarOpen, setNavbarOpen] = React.useState(false);

  return (
    <>
      <nav className="relative flex flex-wrap items-center justify-between px-2 py-0 mb-0 bg-purple-nav h-fit">
        <div className="container px-4 mx-auto flex flex-wrap items-center justify-between">
          <div className="w-full relative flex justify-between lg:w-auto lg:static lg:block lg:justify-start items-center">

          <button
              className="text-black cursor-pointer text-xl leading-none px-3 py-1 border   color-black border-none bg-none block outline-none focus:outline-none"
              type="button"
            >
              <i className="fas fa-bars px-3 py-2 cursor-pointer"><img src={fotoperfil} alt="" /></i>
            </button>

            <button
              className="text-black cursor-pointer text-xl leading-none px-3 py-1 border  border-transparent color-black bg-transparent block lg:hidden outline-none focus:outline-none"
              type="button"
              onClick={() => setNavbarOpen(!navbarOpen)}
            >
              <i className="flex fas fa-bars px-3 py-2 cursor-pointer"><img src={hamburgericon} alt="" /></i>
            </button>
          </div>
          <div
            className={
              "lg:flex flex-grow items-center justify-center" +
              (navbarOpen ? " flex" : " hidden")
            }
            id="example-navbar-danger"
          >
            <ul className="flex relative flex-col lg:flex-row list-none lg:ml-auto">
              <li className="nav-item px-3 py-2 flex items-center text-xs uppercase font-bold leading-snug text-black hover:opacity-75">
                <i className="fab fa-facebook-square text-lg leading-lg text-black opacity-75"></i><Link to="/" className="ml-2 text-black">Container</Link>
              </li>
            </ul>
          </div>       
        </div>
            <h1 className="flex fas fa-bars px-1 py-3">Bem vindo de volta, João!</h1>
      </nav>
    </>


  );
}