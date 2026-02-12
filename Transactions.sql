create table Carro (
id_carro int identity (1,1) ,
placa varchar(100) ,
modelo varchar(100),
tipo varchar(100) 

Constraint tipo_ck check (tipo in('Sedan','Hatch','SUV')),
Constraint placa_un unique (placa)
)

insert into Carro (
placa,modelo,tipo) Values 
('DAS-1412', 'Hyundai HB20', 'Hatch'),
('JHG-3902', 'Fiat Cronos', 'Sedan'),
('IPW-9018', 'Citroen C4 Cactus', 'SUV'),
('JKR-8891', 'Nissan Kicks', 'SUV'),
('TRF-5904', 'Chevrolet Onix', 'Sedan');

SELECT * FROM Carro

begin transaction t1

insert into Carro(placa , modelo , tipo) Values
('CDR-0090', 'Fiat Argo' , 'Hatch')

commit transaction t1


begin transaction t1
update Carro
set modelo =  'Hyundai HB20'
where id_carro = 1
commit transaction t1

--Deletar dados

begin transaction
delete from Carro
where id_carro = 6
commit transaction 

select* from Carro

rollback transaction t1