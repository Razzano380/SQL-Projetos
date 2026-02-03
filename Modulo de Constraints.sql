create table dCliente (
id_cliente int IDENTITY (1, 1) , -- começa em 1 o incremento e vai de em 1
nome_cliente varchar(100) not null , -- se eu nao colocar nada o padrao vai ser null enta ela aceitaria valores nulos
genero varchar(100) not null ,
data_nascimento date not null, 
cpf varchar(100) not null

-- Colocando as restrições adicionais agora
Constraint dCliente_id_cliente_pk primary key (id_cliente) ,
Constraint dCliente_genero_ck check(genero in ('M','F','O', 'PND')),
Constraint dCliente_cpf_un unique(cpf)


)

insert into dCliente(nome_cliente,genero, data_nascimento , cpf)
values
('André Martins',   'M', '12/02/1989', '839.283.190-00'),
('Bárbara Campos',  'F', '07/05/1992', '351.391.410-02'),
('Carol Freitas',   'F', '23/04/1985', '139.274.921-12'),
('Diego Cardoso',   'M', '11/10/1994', '192.371.081-17'),
('Eduardo Pereira', 'M', '09/11/1988', '193.174.192-82'),
('Fabiana Silva',   'F', '02/09/1989', '231.298.471-98'),
('Gustavo Barbosa', 'M', '27/06/1993', '240.174.171-76'),
('Helen Viana',     'F', '11/02/1990', '193.129.183-01'),
('Igor Castro',     'M', '21/08/1989', '184.148.102-29'),
('Juliana Pires',   'F', '13/01/1991', '416.209.192-47')

select * from dCliente

create table dGerente (
id_gerente int identity (1,1),
nome_gerente varchar(100) not null,
data_contratacao varchar(100) not null ,
salario float

Constraint id_gerente_pk primary key (id_gerente),
Constraint salario_ck check(salario >0)

)

insert into dGerente (nome_gerente , data_contratacao , salario)
VALUES
  ('Lucas Sampaio',   '21/03/2015', 6700),
  ('Mariana Padilha', '10/01/2011', 9900),
  ( 'Nathália Santos', '03/10/2018', 7200),
  ('Otávio Costa',    '18/04/2017', 11000)

  select * from dGerente


create table fContratos (
id_contrato int identity (1,1),
data_assinatura date default getdate() ,
id_cliente int ,
id_gerente int,
valor_contrato float 

Constraint id_contrato_pk primary key (id_contrato) ,
Constraint id_cliente_fk foreign key (id_cliente) references dCliente(id_cliente), 
Constraint id_gerente_fk foreign key (id_gerente) references dGerente(id_gerente) ,
Constraint valor_contrato_ck check (valor_contrato > 0)

)


INSERT INTO fContratos(Data_Assinatura, ID_Cliente, ID_Gerente, Valor_Contrato)
VALUES
  ('12/01/2019', 8, 1, 23000),
  ('10/02/2019', 3, 2, 15500),
  ('07/03/2019', 7, 2, 6500),
  ('15/03/2019', 1, 3, 33000),
  ('21/03/2019', 5, 4, 11100),
  ('23/03/2019', 4, 2, 5500),
  ('28/03/2019', 9, 3, 55000),
  ('04/04/2019', 2, 1, 31000),
  ('05/04/2019', 10, 4, 3400),
  ('05/04/2019', 6, 2, 9200)


  -- violação de constraints

  select * from dCliente


  -- Exemplo 1 : Violação not null e check

  insert into dCliente ( nome_cliente, genero , data_nascimento , CPF) values
	( 'F', '10/01/1989' , '123.234.812-99') ;

-- Exemplo 2: Violação de Unique
	  insert into dCliente ( nome_cliente, genero , data_nascimento , CPF) values
	('André Martins', 'F', '10/01/1989' , '123.234.812-99') ;


-- Exemplo 3 : Violação de FK , FOREIGN KEY  e PK PRIMARY KEY

SELECT* from dCliente
select* from dGerente
select * from fContratos

  insert into fContratos( data_assinatura, id_cliente, id_gerente , valor_contrato) values
	( '10/01/1989' , 4,10,1500) ;

--Gerenciando Constraints

-- 1 . Adicionar constraints
-- 2. Renomear Constraints
--3. Remover Constraints

-- Remova a constraint PK da tabela Fcontratos
Alter table fContratos
Drop Constraint id_cliente_fk

-- adicionar a constriant PK id_venda na tabela fContratos
alter table FContratos
add constraint id_contrato_pk primary key (id_contrato)

-- Adicione a constraint FK id_cliente na tabela venddas.
alter table fContratos
add constraint id_cliente_fk foreign key ( id_cliente) references dCliente(id_cliente)


--Exercicios Constraints

--1 . Criando banco de dados
create database AlugaFacil

create table Cliente (
id_cliente int identity (1,1) ,
nome_cliente varchar(100)  not null,
cnh varchar(100) not null  ,
cartao varchar(100) not null

Constraint id_cliente_pk primary key (id_cliente) ,
Constraint cnh_un unique (cnh) 
)

create table Carro (
id_carro int identity (1,1),
placa varchar(100) not null,
modelo varchar(100) not null,
tipo varchar(100) not null

Constraint id_carro_pk primary key (id_carro),
Constraint tipo_ck check (tipo in ( 'Hatch', 'Sedan' ,'SUV')) ,
Constraint placa_un unique(placa)
)

create table Locacoes (
id_locacao int identity (1,1) ,
data_locacao date not null,
data_devolucao date not null,
id_carro int not null,
id_cliente int not null

Constraint id_locacao_pk primary key (id_locacao),
Constraint id_carro_fk foreign key (id_carro) references Carro(id_carro),
Constraint id_cliente_fk foreign key (id_cliente) references Cliente(id_cliente)
)

--Exercitando violar as retrições das constraints criadas para cada tabela.

-- verificando a condição de c
insert into Carro(placa,modelo,tipo) values
	('ABC-123', 'TESTE' ,'teste')

-- INSERINDO VALORES
insert into Carro(placa,modelo,tipo) values
('ABC-123' ,'Teste ', 'SUV')

-- teste a constraint de check
insert into Carro(placa,modelo,tipo) values
('ABC-123' ,'Teste ', 'SUV')