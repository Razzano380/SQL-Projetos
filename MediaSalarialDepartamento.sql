select

avg(YearlyIncome) as 'média'
from DimCustomer

select
CustomerKey,
FirstName,
LastName,
EmailAddress,
YearlyIncome 
from
DimCustomer
where CustomerType = 'Person' 
and YearlyIncome >(
	Select avg(YearlyIncome)
	from
		DimCustomer
	where CustomerType = 'Person'
)






select * from DimCustomer