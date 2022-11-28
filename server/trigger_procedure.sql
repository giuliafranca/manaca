--O trigger tr_update_container é responsável por manter histórico das alterações feitas em cada container automaticamente,--
--inserindo registros nas tabelas de log toda vez que uma alteração é feita em um container--

create or replace trigger tr_update_container
before update on tb_container
for each row

begin
        if(:old.cor_luz <> :new.cor_luz) then
            insert into tb_log_cor_luz values(sq_log_cor_luz.nextval,:old.id_co,:new.cor_luz,SYSDATE);
        end if;
        
        if(:old.periodo_irrigacao <> :new.periodo_irrigacao) then
            insert into tb_log_periodo_irrigacao values(sq_log_periodo_irrigacao.nextval,:old.id_co,:new.periodo_irrigacao,SYSDATE);
        end if;
        
        if(:old.temperatura <> :new.temperatura) then
            insert into tb_log_temperatura values(sq_log_temperatura.nextval,:old.id_co,:new.temperatura,SYSDATE);
        end if;
        
        if(:old.umidade <> :new.umidade) then
            insert into tb_log_umidade values(sq_log_umidade.nextval,:old.id_co,:new.umidade,SYSDATE);
        end if;
        
        if(:old.intensidade_luz <> :new.intensidade_luz) then
            insert into tb_log_intensidade_luz values(sq_log_intensidade_luz.nextval,:old.id_co,:new.intensidade_luz,SYSDATE);
        end if;
        
        if(:old.intensidade_irrigacao <> :new.intensidade_irrigacao) then
            insert into tb_log_intensidade_irrigacao values(sq_log_intensidade_irrigacao.nextval,:old.id_co,:new.intensidade_irrigacao,SYSDATE);
        end if;
        
        if(:old.capacidade_tanque_atu <> :new.capacidade_tanque_atu) then
            insert into tb_log_capacidade_tanque_atu values(sq_log_capacidade_tanque_atu.nextval,:old.id_co,:new.capacidade_tanque_atu,SYSDATE);
        end if;
    
end;
    
--O trigger tr_insert_container é responsável por gerar o registro da primeira entrada de um container no sistema,--
--captando as configurações iniciais--

create or replace trigger tr_insert_container
after insert on tb_container
for each row

begin
        insert into tb_log_cor_luz values(sq_log_cor_luz.nextval,:new.id_co,:new.cor_luz,SYSDATE);
        insert into tb_log_periodo_irrigacao values(sq_log_periodo_irrigacao.nextval,:new.id_co,:new.periodo_irrigacao,SYSDATE);
        insert into tb_log_temperatura values(sq_log_temperatura.nextval,:new.id_co,:new.temperatura,SYSDATE);
        insert into tb_log_umidade values(sq_log_umidade.nextval,:new.id_co,:new.umidade,SYSDATE);
        insert into tb_log_intensidade_luz values(sq_log_intensidade_luz.nextval,:new.id_co,:new.intensidade_luz,SYSDATE);
        insert into tb_log_intensidade_irrigacao values(sq_log_intensidade_irrigacao.nextval,:new.id_co,:new.intensidade_irrigacao,SYSDATE);
        insert into tb_log_capacidade_tanque_atu values(sq_log_capacidade_tanque_atu.nextval,:new.id_co,:new.capacidade_tanque_atu,SYSDATE);
end;


--A procedure pc_checa_condicoes é responsável por checar se cada uma das configurações do container está de acordo com o que é ideal para cada vegetal,--
--e devolve os parâmetros que não estiverem dentro da tolerância como 1. Essa procedure foi feita para ser utilizada pela aplicação,--
--de modo a enviar notificações para o usuário periodicamente, caso algo esteja fora dos conformes.--

CREATE OR REPLACE PROCEDURE pc_checa_condicoes 
    (pID_CO IN INT, pCOR_LUZ OUT INT, pINTENSIDADE_LUZ OUT INT, pINTENSIDADE_IRRIGACAO OUT INT, pPERIODO_IRRIGACAO OUT INT, pTEMPERATURA OUT INT,
     pUMIDADE OUT INT)
AS 
    vCor_luz tb_container.cor_luz%TYPE; 
    vIntensidade_luz tb_container.intensidade_luz%TYPE; 
    vIntensidade_irrigacao tb_container.intensidade_irrigacao%TYPE; 
    vPeriodo_irrigacao tb_container.periodo_irrigacao%TYPE; 
    vTemperatura tb_container.temperatura%TYPE;
    vUmidade tb_container.umidade%TYPE;
    vID_CO INT;
    
    vCor_luz_ideal tb_vegetal.cor_luz_ideal%TYPE; 
    vIntensidade_luz_ideal tb_vegetal.intensidade_luz_ideal%TYPE; 
    vIntensidade_irrigacao_ideal tb_vegetal.intensidade_irrigacao_ideal%TYPE; 
    vPeriodo_irrigacao_ideal tb_vegetal.periodo_irrigacao_ideal%TYPE;
    vTemperatura_ideal tb_vegetal.temperatura_ideal%TYPE;
    vUmidade_ideal tb_vegetal.umidade_ideal%TYPE;
BEGIN
    vID_CO := pID_CO;
    SELECT cor_luz INTO vCor_luz FROM tb_container WHERE tb_container.id_co = vID_CO;
    SELECT cor_luz_ideal INTO vCor_luz_ideal FROM tb_vegetal, tb_plantado
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    SELECT intensidade_luz INTO vIntensidade_luz FROM tb_container WHERE tb_container.id_co = pID_CO;
    SELECT intensidade_luz_ideal INTO vIntensidade_luz_ideal FROM tb_vegetal, tb_plantado 
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    SELECT intensidade_irrigacao INTO vIntensidade_irrigacao FROM tb_container WHERE tb_container.id_co = pID_CO;
    SELECT intensidade_irrigacao_ideal INTO vIntensidade_irrigacao_ideal FROM tb_vegetal, tb_plantado
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    SELECT periodo_irrigacao INTO vPeriodo_irrigacao FROM tb_container WHERE tb_container.id_co = pID_CO;
    SELECT periodo_irrigacao_ideal INTO vPeriodo_irrigacao_ideal FROM tb_vegetal, tb_plantado 
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    SELECT temperatura INTO vTemperatura FROM tb_container WHERE tb_container.id_co = pID_CO;
    SELECT temperatura_ideal INTO vTemperatura_ideal FROM tb_vegetal, tb_plantado
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    SELECT umidade INTO vUmidade FROM tb_container WHERE tb_container.id_co = pID_CO;
    SELECT umidade_ideal INTO vUmidade_ideal FROM tb_vegetal, tb_plantado
    WHERE tb_vegetal.id_v = tb_plantado.id_v AND tb_plantado.id_co = pID_CO;
    
    IF(vCor_luz <> vCor_luz_ideal) THEN
        pCOR_LUZ := 1;
    ELSE 
        pCOR_LUZ := 0;
    END IF;
    
    IF(vIntensidade_luz < (vIntensidade_luz_ideal - 5) or vIntensidade_luz > (vIntensidade_luz_ideal + 5)) THEN
        pINTENSIDADE_LUZ := 1;
    ELSE 
        pINTENSIDADE_LUZ := 0;
    END IF;
    
    IF(vIntensidade_irrigacao < (vIntensidade_irrigacao_ideal*0.95) or vIntensidade_irrigacao > (vIntensidade_irrigacao_ideal*1.05)) THEN
        pINTENSIDADE_IRRIGACAO := 1;
    ELSE 
        pINTENSIDADE_IRRIGACAO := 0;
    END IF;
    
    IF(vPeriodo_irrigacao < (vPeriodo_irrigacao_ideal*0.95) or vPeriodo_irrigacao > (vPeriodo_irrigacao_ideal*1.05)) THEN
        pPERIODO_IRRIGACAO := 1;
    ELSE 
        pPERIODO_IRRIGACAO := 0;
    END IF;
    
    IF(vTemperatura < (vTemperatura_ideal*0.95) or vTemperatura > (vTemperatura_ideal*1.05)) THEN
        pTEMPERATURA := 1;
    ELSE 
        pTEMPERATURA := 0;
    END IF;
    
    IF(vUmidade < (vUmidade_ideal - 5) or vUmidade > (vUmidade_ideal + 5)) THEN
        pUMIDADE := 1;
    ELSE 
        pUMIDADE := 0;
    END IF;
    
END;

-- TESTE DA PROCEDURE pc_checa_condicoes (TEM QUE COLOCAR PRA PRINTAR NOS IFS E ELSES)-- 
DECLARE
pCOR_LUZ INT := 0; pINTENSIDADE_LUZ INT := 0; pINTENSIDADE_IRRIGACAO INT := 0; pPERIODO_IRRIGACAO INT := 0; pTEMPERATURA INT := 0;
     pUMIDADE INT := 0;
BEGIN 
pc_checa_condicoes(2, pCOR_LUZ, pINTENSIDADE_LUZ, pINTENSIDADE_IRRIGACAO, pPERIODO_IRRIGACAO, pTEMPERATURA, pUMIDADE);
END;
