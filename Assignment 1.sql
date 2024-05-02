Tasks to be Performed:
    (5004,2346,106,2023-08-03,600)
------------------------------------------------------------------------------------------------

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
alter column SalesmanId int not null

ALTER TABLE Salesman
ADD CONSTRAINT pk_table_name PRIMARY KEY (SalesmanId);

ALTER TABLE Salesman
ADD CONSTRAINT df_City
DEFAULT 'Chicago' FOR City;


alter table Customer
alter column PurchaseAmount int not null

ALTER TABLE Customer
add CONSTRAINT pk_purchaseamount Primary Key (PurchaseAmount)

ALTER TABLE Customer with nocheck
ADD FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId);

ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;



-------------------------------------------------------------------------------------
Select SalesmanId  from Salesman Union All Select SalesmanId from Customer
--------------------------------------------------------------------------------------

5. Display the below columns which has the matching data.
  FROM  Salesman S
  INNER JOIN  Customer C ON S.SalesmanId = C.SalesmanId
  INNER JOIN  Orders O ON C.PurchaseAmount = O.Amount
 WHERE PurchaseAmount BETWEEN 500 AND 1500;
---------------------------------------------------------------------------------------
 6. Using right join fetch all the results from Salesman and Orders table.
FROM Orders O
RIGHT JOIN Salesman S ON S.SalesmanId = O.SalesmanId
Order by O.Orderdate;

