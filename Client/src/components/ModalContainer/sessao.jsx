import React from "react";
import ModalContainer from "../../components/ModalContainer/Especificacoes/modalContainer";
import GradeContainer from "../../components/ModalContainer/Especificacoes/gradeContainer";
import NotificacaoContainer from "../../components/ModalContainer/Notificacao/notificacaoContainer";
import GradeNotificacao from "../../components/ModalContainer/Notificacao/gradeNotificacao";

function Sessao() {
    return (
      <>
        <section>
        <h1>Container</h1>
        <ModalContainer details = {GradeContainer} />
        </section>
        <section>
        <h1>Notificação</h1>
        <NotificacaoContainer detalhes = {GradeNotificacao} />
        </section>
    </>
  );
}
export default Sessao;