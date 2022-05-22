create database BD_CURSO_WEB; /* cria banco de dados*/

drop database bd_curso_web; /*Exclui banco de dados*/ 

use bd_curso_web; /*Seleciona o banco de dados para manipulacao*/

create table tb_cursos (
	id_curso int not null,
    imagem_curso varchar(100) not null,
    nome_curso char(50) not null,
    resumo text null,
	data_cadastro datetime not null,
    ativo boolean default true,
    investimento float(10, 2) default 0
); /*Cria uma tabela*/

drop table tb_cursos_sql; /* Exclui uma tabela*/

rename table tb_cursos to tb_cursos_sql;/*Renomear tabela*/

alter table tb_cursos_sql add column carga_horaria varchar(5) not null;/*Adicionar coluna na tabela*/

alter table tb_cursos_sql change id_curso id_curso int not null auto_increment; /*Alterar coluna na tabela*/

alter table tb_cursos_sql drop id_curso; /*Remove uma coluna da tabela*/

insert into tb_cursos_sql (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) values (1, 'teste.png', 'Desenvolvimento WEB', 'Curso de desenvolvimento WEB', 19/05/2022, true, 27.59); /*Insere dados em uma tabela*/

select nome_curso, id_curso, resumo, investimento, ativo, imagem_curso, data_cadastro from tb_cursos_sql; /*Recupera registros da tabela*/

insert into tb_cursos_sql (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) values (1, 'teste.png', 'Desenvolvimento WEB', 'Curso de desenvolvimento WEB', 19/05/2022, true, 27.59),(2, 'teste.png', 'Desenvolvimento WEB', 'Curso de desenvolvimento WEB', 19/05/2022, true, 50.59), (13, 'abacaxi', 'teste', 'Curso de desenvolvimento WEB', 10/02/2010, true, 10);

select * from tb_cursos_sql where id_curso = 1; /*Recupera registro a partir de filtros*/

select * from tb_cursos_sql where investimento > 10.00 and id_curso = 1; /*Recupera registro a partir de filtros*/

select * from tb_cursos_sql where id_curso = 13 or investimento < 25; /*Recupera registro a partir de filtros*/

select * from tb_cursos_sql where investimento between 10 and 50; /*Recupera registro a partir de filtros*/

select * from tb_cursos_sql where investimento in (10, 50.59);

select * from tb_cursos_sql where investimento not in (10);

select * from tb_cursos_sql where investimento like '5%';

select * from tb_cursos_sql where investimento like '%9';

select * from tb_cursos_sql where investimento like '%5%';

select * from tb_cursos_sql where investimento like '__.59';

select * from tb_cursos_sql where investimento like '__.__';

select * from tb_cursos_sql where investimento like '%5_';

select * from tb_cursos_sql where nome_curso = 'Desenvolvimento WEB' order by investimento asc;

select * from tb_cursos_sql where nome_curso = 'Desenvolvimento WEB' order by investimento desc, id_curso asc;

select * from tb_cursos_sql where id_curso > 0  limit 2;

select * from tb_cursos_sql;

use framework;

select*from tipo_usuario;

select * from tipo_usuario limit 2, 4;

select * from tipo_usuario order by nome desc limit 3 offset 3;

CREATE TABLE tb_cursos (
  id_curso INT(11) NOT NULL,
  imagem_curso VARCHAR(100) NOT NULL,
  nome_curso CHAR(50) NOT NULL,
  resumo TEXT NULL,
  data_cadastro DATETIME NOT NULL,
  ativo BOOLEAN DEFAULT 1,
  investimento FLOAT(8,2) DEFAULT 0,
  carga_horaria INT(5) NULL  
);


INSERT INTO tb_cursos(id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento, carga_horaria) VALUES (1, 'curso_node.jpg', 'Curso Completo do Desenvolvedor NodeJS e MongoDB', 'Resumo do curso de NodeJS', '2018-01-01', 1, 159.99, 15), (2, 'curso_react_native.jpg', 'Multiplataforma Android/IOS com React e Redux', 'Resumo do curso de React Native', '2018-02-01', 1, 204.99, 37), (3, 'angular.jpg', 'Desenvolvimento WEB com ES6, TypeScript e Angular', 'Resumo do curso de ES6, TypeScript e Angular', '2018-03-01', 1, 579.99, 31), (4, 'web_completo_2.jpg', 'Web Completo 2.0', 'Resumo do curso de Web Completo 2.0', '2018-04-01', 1, 579.99, 59), (5, 'linux.jpg', 'Introdução ao GNU/Linux', 'Resumo do curso de GNU/Linux', '2018-05-01', 0, 0, 1);

select min(investimento) from tb_cursos;

select min(investimento) from tb_cursos where ativo = true; /*Pega o menor valor da coluna*/
 
select max(investimento) from tb_cursos where ativo = true; /*Pega o maior valor da coluna*/

select avg(investimento) from tb_cursos; /*Calcula media geral da coluna selecionada*/

select sum(investimento) from tb_cursos; /*Soma todos os campos de investimento*/

select count(*) from tb_cursos where ativo = true; /*Calcula a quantidade de registros a partir de uma condicao*/

select *, count(*) as total_por_interesse from tb_cursos group by investimento; /*Agrupa os registros com base em uma ou mais colunas cujos valores sejam iguais*/

select *, count(*) as total_por_interesse from tb_cursos group by investimento having id_curso in (3,4);

select *, count(*) as total_por_interesse from tb_cursos where id_curso >= 3 group by investimento having id_curso in (3,4);

select * from tb_cursos;

SET SQL_SAFE_UPDATES=0;

update tb_cursos set imagem_curso = 'curso3', ativo = false where id_curso = 1; /*Atualiza dados de um registro*/

delete from tb_cursos where id_curso = 5; /*Deleta dados de um registro*/

create database loja_virtual;

use loja_virtual;

create table tb_produtos (
	id_produtos int not null primary key auto_increment, /*Primary define a chave primaria da tabela e auto_increment define que o valor sera auto preenchido*/
	produtos varchar(200) not null,
    valor float(8,2) not null
);

create table tb_descricoes_tecnicas (
	id_descricao int not null primary key auto_increment,
    id_produto int not null,
    descricao_tecnica text not null,
    foreign key(id_produto) references tb_produtos(id_produtos) /*Foreign key referencia a chave estrangeira que sera obtida por outra tabela*/
);

select * from tb_produtos;

insert into tb_produtos ( produtos, valor) values ('Notebook Dell Intel core I7, 16GB ram', 2500.00);

insert into tb_produtos ( produtos, valor) values ('Iphone 12 pro', 5000.00);

insert into tb_produtos ( produtos, valor) values ('SAMSUNG GALAXY J7, 16GB ram', 2500.00);

insert into tb_descricoes_tecnicas (id_produto, descricao_tecnica) values (1, '16GB ram DDR4, placa de video GFORCE 1080TI, placa mae ultima geração');

insert into tb_descricoes_tecnicas (id_produto, descricao_tecnica) values (2, '8gb, processador ultima geração, 4 cameras');

insert into tb_descricoes_tecnicas (id_produto, descricao_tecnica) values (3, '16GB ram, processador QUAD CORE, camera de 16 MEGAPIXEL');

select * from tb_descricoes_tecnicas;

create table tb_imagens (
	id_imagem int not null primary key auto_increment,
    id_produto int not null,
	url_imagem varchar(255) not null,
    foreign key (id_produto) references tb_produtos(id_produtos)
);

select * from tb_imagens;

insert into tb_imagens (id_produto, url_imagem) values (1, 'https://pbs.twimg.com/profile_images/1518575739351744515/B4wSBFdy_400x400.jpg');

insert into tb_imagens (id_produto, url_imagem) values (1, 'https://upload.wikimedia.org/wikipedia/pt/b/b4/Corinthians_simbolo.png');

insert into tb_imagens (id_produto, url_imagem) values (2, 'https://www.romapy.com/23379-large_default/apple-iphone-12-pro-128gb-mgml3lza-silver---mgml3lza.jpg'), (2, 'https://cdn.pocket-lint.com/r/s/970x/assets/images/154302-phones-review-iphone-12-pro-review-product-shots-image3-wd487ybwpf.jpg');

create table  tb_clientes (
	id_cliente int not null primary key auto_increment,
    nome varchar(255) not null,
    idade int not null
);

create table tb_pedidos (
	id_pedido int not null primary key auto_increment,
    id_cliente int not null,
    data_hora datetime not null default current_timestamp,
    foreign key(id_cliente) references tb_clientes(id_cliente)
);

create table tb_pedidos_produtos (
	id_pedido int not null,
    id_produto int not null,
    foreign key(id_pedido) references tb_pedidos(id_pedido),
	foreign key(id_produto) references tb_produtos(id_produtos)
);

select * from tb_clientes;

insert into tb_clientes (nome, idade) values ('Guilherme', 18);
insert into tb_clientes (nome, idade) values ('Anderso', 42);

update tb_clientes set nome = 'Anderson' where id_cliente = 2;

select * from tb_pedidos;

insert into tb_pedidos (id_cliente) values (1), (2);

insert into tb_pedidos_produtos (id_pedido, id_produto) values (5, 1),  (6, 3);

select * from tb_pedidos_produtos;

select * from tb_clientes left join tb_pedidos on (tb_clientes.id_cliente = tb_pedidos.id_cliente);

select * from tb_produtos left join tb_imagens on (tb_produtos.id_produtos = tb_imagens.id_produto);

select * from tb_pedidos right join tb_pedidos_produtos on (tb_pedidos.id_pedido = tb_pedidos_produtos.id_pedido) left join tb_produtos on (tb_pedidos_produtos.id_produto = tb_produtos.id_produtos);

select * from tb_pedidos inner join tb_pedidos_produtos on (tb_pedidos.id_pedido = tb_pedidos_produtos.id_pedido) inner join tb_produtos on (tb_pedidos_produtos.id_produto = tb_produtos.id_produtos);

select pp.id_pedido, p.* from tb_pedidos_produtos as pp inner join tb_produtos as p on (pp.id_produto = p.id_produtos) where p.valor >= 2500.00;

select pp.id_pedido, p.* from tb_pedidos_produtos as pp inner join tb_produtos as p on (pp.id_produto = p.id_produtos) where p.valor >= 2500.00 order by pp.id_pedido asc;