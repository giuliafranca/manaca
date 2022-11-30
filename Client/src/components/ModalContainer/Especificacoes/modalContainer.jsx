import React from "react";

function ModalContainer(props) {
    return(
        <>
            {props.details.map((value, index)=>
                <div className="container" key={index}>
                    <h3 className="container-titulo">{value.titulo}</h3>
                    <p className="container-descricao">{value.desc}</p>
                </div>
            )}
        </>
    )
}

export default ModalContainer;