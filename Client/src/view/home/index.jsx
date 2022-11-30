import React from "react";
import Sessao from "../../components/ModalContainer/sessao"
import NavBar from "../../components/NavBar/navBar"
// import ModalContainer from "../../components/ModalContainer/modalContainer";

function Home() {
  return (
    <>
      <nav>
        <NavBar />
      </nav>
      <main>
        <Sessao />
      </main>
    </>
  );
}
export default Home;