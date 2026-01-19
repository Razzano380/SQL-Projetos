select
ID_Loja,
Nome_Loja,
Regiao,
QTD_Vendida,
sum(Qtd_Vendida) over(Partition by Regiao) as  'Total vendido',
format(Qtd_vendida/sum(Qtd_vendida) over (Partition by Regiao),'0.00%') as '% do total'
from Lojas
order by ID_Loja



