import React from "react";
function NavBar() {
  return (
    <>
      <nav className="navbar fixed-top navbar-expand-lg" style={{backgroundColor: "#0099FF"}}>
        <div className="container-fluid">
          
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse justify-content-evenly" id="navbarNav">
            <ul className="navbar-nav">
              <li><img src={brand} alt="" className=" me-5 mt-3"/></li>
              <li className="nav-item">
                <a className="nav-link active text-white mx-5 mb-3 mt-3" aria-current="page" href="#">Sobre</a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-white mx-4 mb-3 mt-3" href="#">Serviços</a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-white mx-4 mb-3 mt-3" href="#">Contato</a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-white mx-4 mt-3">Portifolio</a>
              </li>
              <li className="nav-item">
                <a className="nav-link px-4 bg-light ms-4 mb-3 mt-3" style={{color: "#0099FF"}}>Faça um orçamento</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </>
  )
}
export default NavBar;