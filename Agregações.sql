select
ID_Loja,
Nome_Loja,
Regiao,
QTD_Vendida,
sum(Qtd_Vendida) over(Partition by Regiao) as  'Total vendido'
from Lojas

