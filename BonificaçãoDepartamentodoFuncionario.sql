SELECT *
FROM DimEmployee
WHERE DepartmentName = (
    -- A Subquery vai lá buscar: "Qual é o departamento do Miguel?"
    -- Resultado: "Marketing" (por exemplo)
    SELECT DepartmentName
    FROM DimEmployee
    WHERE FirstName = 'Miguel' AND LastName = 'Severino'
)

select * from DimEmployee
where FirstName = 'Miguel' and LastName = 'Severino'

select * from DimEmployee
where DepartmentName = 'Production'