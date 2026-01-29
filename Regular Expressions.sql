-- Para descobrir o collation configurado :

select SERVERPROPERTY ('collation')

-- especificar o collation

create database BD_Collation
collate Latin1_General_CS_AS

--Alterar o collate
alter database BD_Collation  Collate Latin1_General_CI_AS