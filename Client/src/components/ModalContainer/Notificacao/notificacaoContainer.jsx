import React from "react";
// import './modalContainer.css';

function NotificacaoContainer(props) {
    return(
        <>
            {props.detalhes.map((valor, indice)=>
                <div className="notificacao" key={indice}>
                    <p className="noticacao-box">{valor.titulo}</p>
                    <p>{valor.alteracao}</p>
                </div>
            )}
        </>
    )
}

export default NotificacaoContainer;