--O trigger tr_update_container é responsável por manter histórico das alterações feitas em cada container automaticamente,--
--inserindo registros nas tabelas de log toda vez que uma alteração é feita em um container--
create or replace function update_trigger_func()
returns trigger as $$
begin
        if(old.cor_luz <> new.cor_luz) then
            insert into tb_log_cor_luz values(nextval('sq_log_cor_luz'),old.id_co,new.cor_luz,current_date);
        end if;
        
        if(old.periodo_irrigacao <> new.periodo_irrigacao) then
            insert into tb_log_periodo_irrigacao values(nextval('sq_log_periodo_irrigacao'),old.id_co,new.periodo_irrigacao,current_date);
        end if;
        
        if(old.temperatura <> new.temperatura) then
            insert into tb_log_temperatura values(nextval('sq_log_temperatura'),old.id_co,new.temperatura,current_date);
        end if;
        
        if(old.umidade <> new.umidade) then
            insert into tb_log_umidade values(nextval('sq_log_umidade'),old.id_co,new.umidade,current_date);
        end if;
        
        if(old.intensidade_luz <> new.intensidade_luz) then
            insert into tb_log_intensidade_luz values(nextval('sq_log_intensidade_luz'),old.id_co,new.intensidade_luz,current_date);
        end if;
        
        if(old.intensidade_irrigacao <> new.intensidade_irrigacao) then
            insert into tb_log_intensidade_irrigacao values(nextval('sq_log_intensidade_irrigacao'),old.id_co,new.intensidade_irrigacao,current_date);
        end if;
        
        if(old.capacidade_tanque_atu <> new.capacidade_tanque_atu) then
            insert into tb_log_capacidade_tanque_atu values(nextval('sq_log_capacidade_tanque_atu'),old.id_co,new.capacidade_tanque_atu,current_date);
        end if;
    return null;
end;
$$ language plpgsql;

create or replace trigger tg_update_container
before update on tb_container
for each row
execute procedure update_trigger_func();
    
--O trigger tr_insert_container é responsável por gerar o registro da primeira entrada de um container no sistema,--
--captando as configurações iniciais--
create or replace function insert_trigger_func()
returns trigger as $$
begin
	insert into tb_log_cor_luz values(nextval('sq_log_cor_luz'),new.id_co,new.cor_luz,current_date);
	insert into tb_log_periodo_irrigacao values(nextval('sq_log_periodo_irrigacao'),new.id_co,new.periodo_irrigacao,current_date);
	insert into tb_log_temperatura values(nextval('sq_log_temperatura'),new.id_co,new.temperatura,current_date);
	insert into tb_log_umidade values(nextval('sq_log_umidade'),new.id_co,new.umidade,current_date);
	insert into tb_log_intensidade_luz values(nextval('sq_log_intensidade_luz'),new.id_co,new.intensidade_luz,current_date);
	insert into tb_log_intensidade_irrigacao values(nextval('sq_log_intensidade_irrigacao'),new.id_co,new.intensidade_irrigacao,current_date);
	insert into tb_log_capacidade_tanque_atu values(nextval('sq_log_capacidade_tanque_atu'),new.id_co,new.capacidade_tanque_atu,current_date);
return null;
end;
$$ language plpgsql;

create or replace trigger tg_insert_container
after insert on tb_container
for each row
execute procedure insert_trigger_func();

--A procedure pc_checa_condicoes é responsável por checar se cada uma das configurações do container está de acordo com o que é ideal para cada vegetal,--
--e devolve os parâmetros que não estiverem dentro da tolerância como 1. Essa procedure foi feita para ser utilizada pela aplicação,--
--de modo a enviar notificações para o usuário periodicamente, caso algo esteja fora dos conformes.--
create or replace procedure pc_checa_condicoes 
    (pID_CO IN INT, pCOR_LUZ OUT INT, pINTENSIDADE_LUZ OUT INT, pINTENSIDADE_IRRIGACAO OUT INT, pPERIODO_IRRIGACAO OUT INT, pTEMPERATURA OUT INT,
     pUMIDADE OUT INT)
language plpgsql
as $$
declare
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
begin
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
end;$$

-- TESTE DA PROCEDURE pc_checa_condicoes (TEM QUE COLOCAR PRA PRINTAR NOS IFS E ELSES)-- 
DECLARE
pCOR_LUZ INT := 0; pINTENSIDADE_LUZ INT := 0; pINTENSIDADE_IRRIGACAO INT := 0; pPERIODO_IRRIGACAO INT := 0; pTEMPERATURA INT := 0;
     pUMIDADE INT := 0;
BEGIN 
pc_checa_condicoes(2, pCOR_LUZ, pINTENSIDADE_LUZ, pINTENSIDADE_IRRIGACAO, pPERIODO_IRRIGACAO, pTEMPERATURA, pUMIDADE);
END;
