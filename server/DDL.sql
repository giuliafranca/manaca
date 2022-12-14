create table tb_cliente(
    id_c serial primary key,
    nome varchar(30) not null,
    cpf varchar(14) not null,
    senha varchar(60) not null,
    email varchar(60) not null,
    
    unique(id_c, cpf)
);

create table tb_container(
    id_co serial primary key,
    id_c int not null,
    endereco varchar(120) not null,
    cor_luz varchar(20) not null,
    intensidade_luz numeric(5,2) not null,
    intensidade_irrigacao int not null,
    periodo_irrigacao int not null,
    temperatura numeric(5,2) not null,
    umidade numeric(5,2) not null,
    capacidade_tanque_max int not null,
    capacidade_tanque_atu int not null,
    
    unique(id_co) 
);

create table tb_log_intensidade_luz(
    id_lil serial primary key,
    id_co int not null,
    intensidade_luz numeric(5,2) not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lil)
);

create table tb_log_intensidade_irrigacao(
    id_lii serial primary key,
    id_co int not null,
    intensidade_irrigacao int not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lii)
);

create table tb_log_capacidade_tanque_atu(
    id_lcta serial primary key,
    id_co int not null,
    intensidade_capacidade_tanque_atu int not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lcta)
);

create table tb_log_cor_luz(
    id_lcl serial primary key,
    id_co int not null,
    cor_luz varchar(20) not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lcl)
);

create table tb_log_periodo_irrigacao(
    id_lpi serial primary key,
    id_co int not null,
    periodo_irrigacao int not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lpi)
);

create table tb_log_temperatura(
    id_lt serial primary key,
    id_co int not null,
    temperatura numeric(5,2) not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lt)
);

create table tb_log_umidade(
    id_lu serial primary key,
    id_co int not null,
    umidade numeric(5,2) not null,
    data_hora timestamp not null default current_timestamp,
    
    unique(id_lu)
);

create table tb_plantado(
    id_p serial primary key,
    id_co int not null,
    id_v int not null,
    
    unique(id_p)
);

create table tb_vegetal(
    id_v serial primary key,
    nome varchar(30) not null,
    temperatura_ideal numeric(5,2) not null,
    cor_luz_ideal varchar(20) not null,
    umidade_ideal numeric(5,2) not null,
    periodo_irrigacao_ideal int not null,
    intensidade_irrigacao_ideal int not null,
    intensidade_luz_ideal numeric(5,2) not null,
    tempo_plantado_ideal int not null,
    
    unique(id_v)
);

create table tb_movimentacoes_plantacao(
    id_mp serial primary key,
    id_p int not null,
    id_tm int not null,
    data_movimentacao timestamp not null default current_timestamp,
    
    unique(id_mp)
);

create table tb_tipo_movimentacao(
    id_tm serial primary key,
    nome varchar(20) not null,
    
    unique(id_tm)
);

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
