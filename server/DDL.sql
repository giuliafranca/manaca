alter session set nls_date_format = 'DD/MM/YYYY HH24:MI:SS';

create table tb_cliente(
    id_C int not null,
    nome varchar2(30) not null,
    cpf varchar2(14) not null,
    senha varchar2(60) not null,
    email varchar2(60) not null,
    
    primary key(id_c)
);

create sequence sq_cliente
start with 0
minvalue 0
increment by 1
order;

create table tb_container(
    id_co int not null,
    id_c int not null,
    endereco varchar2(120) not null,
    cor_luz varchar2(20) not null,
    intensidade_luz numeric(5,2) not null,
    intensidade_irrigacao int not null,
    periodo_irrigacao int not null,
    temperatura numeric(5,2) not null,
    umidade numeric(5,2) not null,
    capacidade_tanque_max int not null,
    capacidade_tanque_atu int not null,
    
    primary key(id_co)
);

create sequence sq_container
start with 0
minvalue 0
increment by 1
order;

create table tb_log_intensidade_luz(
    id_lil int not null,
    id_co int not null,
    intensidade_luz numeric(5,2) not null,
    data_hora date not null,
    
    primary key(id_lil)
);

create sequence sq_log_intensidade_luz
start with 0
minvalue 0
increment by 1
order;

create table tb_log_intensidade_irrigacao(
    id_lii int not null,
    id_co int not null,
    intensidade_irrigacao int not null,
    data_hora date not null,
    
    primary key(id_lii)
);

create sequence sq_log_intensidade_irrigacao
start with 0
minvalue 0
increment by 1
order;

create table tb_log_capacidade_tanque_atu(
    id_lcta int not null,
    id_co int not null,
    intensidade_capacidade_tanque_atu int not null,
    data_hora date not null,
    
    primary key(id_lcta)
);

create sequence sq_log_capacidade_tanque_atu
start with 0
minvalue 0
increment by 1
order;

create table tb_log_cor_luz(
    id_lcl int not null,
    id_co int not null,
    cor_luz varchar2(20) not null,
    data_hora date not null,
    
    primary key(id_lcl)
);

create sequence sq_log_cor_luz
start with 0
minvalue 0
increment by 1
order;

create table tb_log_periodo_irrigacao(
    id_lpi int not null,
    id_co int not null,
    periodo_irrigacao int not null,
    data_hora date not null,
    
    primary key(id_lpi)
);

create sequence sq_log_periodo_irrigacao
start with 0
minvalue 0
increment by 1
order;

create table tb_log_temperatura(
    id_lt int not null,
    id_co int not null,
    temperatura numeric(5,2) not null,
    data_hora date not null,
    
    primary key(id_lt)
);

create sequence sq_log_temperatura
start with 0
minvalue 0
increment by 1
order;

create table tb_log_umidade(
    id_lu int not null,
    id_co int not null,
    umidade numeric(5,2) not null,
    data_hora date not null,
    
    primary key(id_lu)
);

create sequence sq_log_umidade
start with 0
minvalue 0
increment by 1
order;

create table tb_plantado(
    id_p int not null,
    id_co int not null,
    id_v int not null,
    
    primary key(id_p)
);

create sequence sq_plantado
start with 0
minvalue 0
increment by 1
order;

create table tb_vegetal(
    id_v int not null,
    nome varchar(30) not null,
    temperatura_ideal numeric(5,2) not null,
    cor_luz_ideal varchar2(20) not null,
    umidade_ideal numeric(5,2) not null,
    periodo_irrigacao_ideal int not null,
    intensidade_irrigacao_ideal int not null,
    intensidade_luz_ideal numeric(5,2) not null,
    tempo_plantado_ideal int not null,
    
    primary key(id_v)
);

create sequence sq_vegetal
start with 0
minvalue 0
increment by 1
order;

create table tb_movimentacoes_plantacao(
    id_mp int not null,
    id_p int not null,
    id_tm int not null,
    data_movimentacao date not null,
    
    primary key(id_mp)
);

create sequence sq_movimentacoes_plantacao
start with 0
minvalue 0
increment by 1
order;

create table tb_tipo_movimentacao(
    id_tm int not null,
    nome varchar2(20) not null,
    
    primary key(id_tm)
);

create sequence sq_tipo_movimentacao
start with 0
minvalue 0
increment by 1
order;

alter table tb_container add constraint fk_tb_container
foreign key(id_c) references tb_cliente(id_c);

alter table tb_log_intensidade_luz add constraint fk_tb_log_intensidade_luz
foreign key(id_co) references tb_container(id_co);

alter table tb_log_intensidade_irrigacao add constraint fk_tb_log_intensidade_irrigacao
foreign key(id_co) references tb_container(id_co);

alter table tb_log_capacidade_tanque_atu add constraint fk_tb_log_capacidade_tanque_atu
foreign key(id_co) references tb_container(id_co);

alter table tb_log_cor_luz add constraint fk_tb_log_cor_luz
foreign key(id_co) references tb_container(id_co);

alter table tb_log_periodo_irrigacao add constraint fk_tb_log_periodo_irrigacao
foreign key(id_co) references tb_container(id_co);

alter table tb_log_temperatura add constraint fk_tb_log_temperatura
foreign key(id_co) references tb_container(id_co);

alter table tb_log_umidade add constraint fk_tb_log_umidade
foreign key(id_co) references tb_container(id_co);

alter table tb_plantado add constraint fk_tb_plantado
foreign key(id_co) references tb_container(id_co);

alter table tb_plantado add constraint fk_tb_plantado1
foreign key(id_v) references tb_vegetal(id_v);

alter table tb_movimentacoes_plantacao add constraint fk_tb_movimentacoes_plantacao
foreign key(id_p) references tb_plantado(id_p);

alter table tb_movimentacoes_plantacao add constraint fk_tb_movimentacoes_plantacao1
foreign key(id_tm) references tb_tipo_movimentacao(id_tm);
