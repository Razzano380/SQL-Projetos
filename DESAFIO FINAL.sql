CREATE TABLE Calendario (
 data date
)
DECLARE @varAnoInicial INT = YEAR((SELECT MIN(DateFirstPurchase) FROM
ContosoRetailDW.dbo.DimCustomer))
DECLARE @varAnoFinal INT = YEAR((SELECT MAX(DateFirstPurchase) FROM
ContosoRetailDW.dbo.DimCustomer))
DECLARE @varDataInicial DATE = DATEFROMPARTS(@varAnoInicial, 1, 1)
DECLARE @varDataFinal DATE = DATEFROMPARTS(@varAnoFinal, 12, 31)
WHILE @varDataInicial <= @varDataFinal
BEGIN
INSERT INTO Calendario(data) VALUES(@varDataInicial)
SET @varDataInicial = DATEADD(DAY, 1, @varDataInicial)
END

ALTER TABLE Calendario
ADD Ano INT,
Mes INT,
Dia INT,
AnoMes INT,
NomeMes VARCHAR(50)

UPDATE Calendario SET Ano = YEAR(data)
UPDATE Calendario SET Mes = MONTH(data)
UPDATE Calendario SET Dia = DAY(data)
UPDATE Calendario SET AnoMes = CONCAT(YEAR(data), FORMAT(MONTH(data), '00'))
UPDATE Calendario SET NomeMes =
CASE
WHEN MONTH(data) = 1 THEN 'Janeiro'
WHEN MONTH(data) = 2 THEN 'Fevereiro'
WHEN MONTH(data) = 3 THEN 'Março'
WHEN MONTH(data) = 4 THEN 'Abril'
WHEN MONTH(data) = 5 THEN 'Maio'
WHEN MONTH(data) = 6 THEN 'Junho'
WHEN MONTH(data) = 7 THEN 'Julho'
WHEN MONTH(data) = 8 THEN 'Agosto'
WHEN MONTH(data) = 9 THEN 'Setembro'
WHEN MONTH(data) = 10 THEN 'Outubro'
WHEN MONTH(data) = 11 THEN 'Novembro'
WHEN MONTH(data) = 12 THEN 'Dezembro'
END

CREATE VIEW vwNovosClientes AS
SELECT
ROW_NUMBER() OVER(ORDER BY AnoMes) AS 'ID',
Ano,
NomeMes,
COUNT(DimCustomer.DateFirstPurchase) AS 'Novos_Clientes'
FROM Calendario
LEFT JOIN ContosoRetailDW.dbo.DimCustomer
ON Calendario.data = DimCustomer.DateFirstPurchase
GROUP BY Ano, NomeMes, AnoMes

select * from vwNovosClientes


--Calculo dos ultimos 2 meses 
select *, 
sum(Novos_Clientes) over(order by NomeMes rows  between  2 preceding and current row ) as 'Ultimos 2 meses'
from
vwNovosClientes

--Calculo media movel ultimso 2 meses 
select *, 
avg(Novos_Clientes) over(order by NomeMes rows  between  2 preceding and current row ) as 'Ultimos  media 2 meses'
from
vwNovosClientes


-- Acmulado ao longo do tempo

select *, 
sum(Novos_Clientes) over(order by NomeMes rows  between  unbounded preceding and current row ) as 'Acumulado total'
from
vwNovosClientes

--Intra ano - acumulado de janeiro ate dezembro de cada ano
select *, 
Sum(Novos_Clientes) over(partition by Ano order by ID Rows between unbounded preceding  and current row ) as 'Acumulado Year to date'
from
vwNovosClientes

-- Calculo de MoM e YoY % de Crescimento de novos clientes entre o Mês atual e o mês anterior 
use  Desafio
select* from vwNovosClientes
select *,
format(1.0* Novos_Clientes/
	nullif(lag(Novos_Clientes,1) Over(order by ID ),0 )-1 , '0.00%') as '% MoM',
format(1.0* Novos_Clientes/
	nullif(lag(Novos_Clientes,12) Over(order by ID ),0 )-1 , '0.00%') as '% YoY'
from vwNovosClientes
		




--