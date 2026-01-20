CREATE TABLE Resultado(
Data_Fechamento DATETIME,
Mes_Ano VARCHAR(100),
Faturamento_MM FLOAT)

INSERT INTO Resultado(Data_Fechamento, Mes_Ano, Faturamento_MM)
VALUES
	('01/01/2020', 'JAN-20', 8),
	('01/02/2020', 'FEV-20', 10),
	('01/03/2020', 'MAR-20', 6),
	('01/04/2020', 'ABR-20', 9),
	('01/05/2020', 'MAI-20', 5),
	('01/06/2020', 'JUN-20', 4),
	('01/07/2020', 'JUL-20', 7),
	('01/08/2020', 'AGO-20', 11),
	('01/09/2020', 'SET-20', 9),
	('01/10/2020', 'OUT-20', 12),
	('01/11/2020', 'NOV-20', 11),
	('01/12/2020', 'DEZ-20', 10)

-- soma movel


select
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	SUM(Faturamento_MM) over(order by Data_Fechamento Rows between 1 preceding and current row) as 'Soma movel'
from
	Resultado

-- Calculo do acumulado
select
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	SUM(Faturamento_MM) over(order by Data_Fechamento Rows between UNBOUNDED preceding and current row) as 'ACUMULADO'
from
	Resultado

-- uM POUCO MAIS DE SOMA MOVEL E ACUMULADO

select
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	SUM(Faturamento_MM) over(order by Data_Fechamento Rows between 1 preceding and 1 Following) as 'ACUMULADO'
from
	Resultado

-- Funções de Offset ( Deslocamento) : Lag e Lead : Permite acessar o valor da linha anterior

select
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	lag(Faturamento_MM,1,0) Over ( Order by Data_Fechamento), --acessou duas linhas anteriores, se caso nao achar nenhum valor ele coloca o valor 0
	lead(Faturamento_MM,1,0) Over ( Order by Data_Fechamento) --acessou duas linhas PRA FRENTE, se caso nao achar nenhum valor ele coloca 0 
from
	Resultado


--Calculo MoM ( MONTH OVER MONTH)
-- (Valor Mes atual - Valor mes anterior) / ( Valor do Mes anterior)
-- (valor Mes atual)/ (Valor do mes anterior) - (Valor mes anterior) / (Valor mes anterior)
--(valor mes atual) / (Valor do mes anterior) -1 
select
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	format(
		Isnull(
				(Faturamento_MM/nullif(lag(Faturamento_MM,1 ,0) Over ( Order by Data_Fechamento),0)) - 1,0 ), '0.00%')
FROM
Resultado

--First Value e Last value


