

create table Tablea (
ID INT,
Nome Varchar(100) collate Latin1_General_CS_AS)

Insert into Tablea (ID,Nome)
Values
	(1, 'Matheus'),
	(2, 'Marcela'),
	(3, 'Marcos') ,
	(4,'MAuricio'),
	(5, 'Marta')

Select * from Tablea

select 
ID,
Nome
From
Tablea
where Nome = 'marcela'
DROP table Tablea

CREATE TABLE Nomes(
ID INT,
Nome VARCHAR(100) COLLATE Latin1_General_CS_AS)

INSERT INTO Nomes(ID, Nome)
VALUES
(1, 'Matheus'), (2, 'Marcela'), (3, 'marcos'), (4, 'MAuricio'), (5, 'Marta'), (6, 'Miranda'), (7, 'Melissa'), (8, 'Lucas'), (9, 'luisa'), (10, 'Pedro')


select* from Nomes

select * 
from Nomes
where Nome Like '%Mar%'

-- Retorna as linhas onde a primeira letra seja 'm', a segunda seja 'a'  e a terceira seja 'r'
select * 
from Nomes
where Nome Like '[M][a][r]%'

-- retorna as linhas onde a primeira letra seja 'M' ou 'm' e a segunda seja 'A' ou 'a'
select * 
from Nomes
where Nome Like '[Mm][Aa]%'

USE BD_Collation
CREATE TABLE Textos(
ID INT,
Texto VARCHAR(100) COLLATE Latin1_General_CS_AS)

INSERT INTO Textos(ID, Texto)
VALUES
(1, 'Marcos'), (2, 'Excel'), (3, 'leandro'), (4, 'K'), (5, 'X7'), (6, '19'), (7, '#M'), (8, '@9'), (9, 'M'), (10, 'RT')

select * from Textos


-- RETORNA NOMES QUE COMEÇAM COM A LETRA M , E OU K
select *
from Textos
where Texto like '[MEK]%'

-- Retorna nomes que possuem apenas 1 Caracter
select *
from Textos
where Texto like '[A-z]'

-- Retorna nomes que possuem apenas 2 Caracter
select *
from Textos
where Texto like '[A-z][A-z]'

-- Retorna nomes que possuem apenas 2 Caracter : o PRIMEIRO UMA LETRA E O SEGUNDO UM NUMERO

select *
from Textos
where Texto like '[A-z][0-9]'

CREATE TABLE Nomes(
ID INT,
Nome VARCHAR(100) COLLATE Latin1_General_CS_AS)

INSERT INTO Nomes(ID, Nome)
VALUES
(1, 'Matheus'), (2, 'Marcela'), (3, 'marcos'), (4, 'MAuricio'), (5, 'Marta'), (6, 'Miranda'), (7, 'Melissa'), (8, 'Lucas'), (9, 'luisa'), (10, 'Pedro')

select* from Nomes
-- Retorna os nomes que:
-- 1. Começam com a letra 'M' ou 'm'
-- 2. O segundo caractere pode ser qualquer coisa ('_' é um curinga)
-- 3. O terceiro caractere pode ser a letra 'R' ou a letra 'r'
-- 4. Possui uma quantidade qualquer de caracteres depois do terceiro (por conta do '%')
select* from
Nomes
Where Nome like '[Mm]_[Rr]%'


-- o ^ é para negação , pra trazer todos aqueles que NAO começam com L ou 1 
select* from
Nomes
Where Nome like '[^M_m1]%'
