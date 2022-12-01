import hamburgericon from '../../../assets/svg/Vector.svg'
import { Link } from "react-router-dom";
import React from 'react';
export default function NavBar() {
  const [navbarOpen, setNavbarOpen] = React.useState(false);

  return (
    <>
      <nav className="relative flex flex-wrap items-center justify-between px-2 py-0 mb-0 bg-purple-nav h-fit">
        <div className="container px-4 mx-auto flex flex-wrap items-center justify-between">
          <div className="w-full relative flex justify-between lg:w-auto lg:static lg:block lg:justify-start">
            <Link to="/"
              className="text-sm font-bold leading-relaxed inline-block mr-4 py-1 "
              href="#pablo"
            >
              <img src="" alt="" className="h-14 w-auto" />
            </Link>
            <button
              className="text-white cursor-pointer text-xl leading-none px-3 py-1 border  border-transparent  bg-transparent block lg:hidden outline-none focus:outline-none"
              type="button"
              onClick={() => setNavbarOpen(!navbarOpen)}
            >
              <i className="fas fa-bars"><img src={hamburgericon} alt="" /></i>
            </button>
          </div>
          <div
            className={
              "lg:flex flex-grow items-center justify-center" +
              (navbarOpen ? " flex" : " hidden")
            }
            id="example-navbar-danger"
          >
            <ul className="flex flex-col lg:flex-row list-none lg:ml-auto">
              <li className="nav-item px-3 py-2 flex items-center text-xs uppercase font-bold leading-snug text-white hover:opacity-75">
                <i className="fab fa-facebook-square text-lg leading-lg text-white opacity-75"></i><Link to="/" className="ml-2">Container</Link>
              </li>
              <li className="nav-item px-3 py-2 flex items-center text-xs uppercase font-bold leading-snug text-white hover:opacity-75">
                <i className="fab fa-twitter text-lg leading-lg text-white opacity-75"></i><Link to="/" className="ml-2">Container</Link>
              </li>
              <li className="nav-item px-3 py-2 flex items-center text-xs uppercase font-bold leading-snug text-white hover:opacity-75">
                <i className="fab fa-facebook-square text-lg leading-lg text-white opacity-75"></i><Link to="/" className="ml-2">Container</Link>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </>


  );
}