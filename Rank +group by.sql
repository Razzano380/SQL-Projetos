select 
	Regiao as 'Região',
	sum(Qtd_Vendida) as 'Total vendido' ,
	rank () over ( order by Sum(Qtd_Vendida) desc ) as 'Ranking'

from 
Lojas
group by Regiao
order by [Total vendido] desc