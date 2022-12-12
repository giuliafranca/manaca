import React from "react";
import ModalContainer from "../../components/ModalContainer/Especificacoes/modalContainer";
import GradeContainer from "../../components/ModalContainer/Especificacoes/gradeContainer";
import NotificacaoContainer from "../../components/ModalContainer/Notificacao/notificacaoContainer";
import { Link } from 'react-router-dom';

function Sessao() {
    return (
      <>
      <main>
        <div className="bc-red">
          <div className="flex relative px-3 lg:flex-row list-none lg:ml-auto justify-between">
            <h1>Container Leste</h1> 
            <Link to="/container-funcionalidades" className="ml-2">Veja mais</Link>     
          </div>
        <ModalContainer details = {GradeContainer} />
        </div>
        <div>
        <h1>Notificação</h1>
        <NotificacaoContainer detalhes = {GradeContainer} />
        </div>  
      </main>

    </>
  );
}
export default Sessao;