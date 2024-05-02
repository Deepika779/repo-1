Tasks to be Performed:1. Insert a new record in your Orders table.Insert INTO Orders Values
    (5004,2346,106,2023-08-03,600)
------------------------------------------------------------------------------------------------

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default   constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId   column in Customer table. Add not null constraint in Customer_name column for the   Customer table. alter table Salesman
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

------------------------------------------------------------------------------------------------   3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchaseamount value greater than 500.Select * from CUSTOMER Where CustomerName Like '%N' or PurchaseAmount >500

-------------------------------------------------------------------------------------   4. Using SET operators, retrieve the first result with unique SalesmanId values from twotables, and the other result containing SalesmanId with duplicates from two tables.Select SalesmanId  from Salesman Union Select SalesmanId from Customer
Select SalesmanId  from Salesman Union All Select SalesmanId from Customer
--------------------------------------------------------------------------------------

5. Display the below columns which has the matching data.Orderdate, Salesman Name, Customer Name, Commission, and City which has therange of Purchase Amount between 500 to 1500.SELECT Orderdate, SalesmanName, CustomerName, Commission, City
  FROM  Salesman S
  INNER JOIN  Customer C ON S.SalesmanId = C.SalesmanId
  INNER JOIN  Orders O ON C.PurchaseAmount = O.Amount
 WHERE PurchaseAmount BETWEEN 500 AND 1500;
---------------------------------------------------------------------------------------
 6. Using right join fetch all the results from Salesman and Orders table.SELECT OrderId,CustomerId,OrderDate,Amount
FROM Orders O
RIGHT JOIN Salesman S ON S.SalesmanId = O.SalesmanId
Order by O.Orderdate;

