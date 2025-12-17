select * from DimStore
where Exists (
	( Select
	* from
	FactSales
	where StoreName = 'Contoso Orlando Store'
)
)

select * from FactSales

SELECT * FROM FactSales
WHERE StoreKey = (
    SELECT StoreKey 
    FROM DimStore 
    WHERE StoreName = 'Contoso Orlando Store'
);

select 
ProductKey,
ProductName,
UnitPrice ,
 (			select 
				UnitPrice
			From DimProduct
		 where ProductKey = 1893 )	as 'Coluna extra'

from DimProduct
where UnitPrice > ( 
	select 
	 UnitPrice
	From DimProduct
	where ProductKey = 1893 
	               )