import React from "react";

function NotificacaoContainer(props) {
    return(
        <>
            {props.detalhes.map((valor, indice)=>
                <div className="notificacao" key={indice}>
                    <p className="noticacao-box"> O campo {valor.titulo} foi atualizado para  {valor.desc}.</p>
                </div>
            )}
        </>
    )
}

export default NotificacaoContainer;