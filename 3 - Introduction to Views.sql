-- Demonstration 3 - Introduction to views

-- Step 1 - Open a new query window to the AdventureWorks database

USE AdventureWorks;
GO

-- Step 2 - Create a new view

CREATE VIEW Person.IndividualsWithEmail1
AS
SELECT p.BusinessEntityID, Title, FirstName, MiddleName, LastName, E.EmailAddress
FROM Person.Person AS p
JOIN Person.EmailAddress as e
on p.BusinessEntityID=e.BusinessEntityID;
GO

-- Step 3 - Query the view

SELECT * FROM Person.IndividualsWithEmail1;
GO

-- Step 4 - Again query the view and order the results

SELECT * 
FROM Person.IndividualsWithEmail
ORDER BY LastName desc;
GO

-- Step 5 - Query the view definition via OBJECT_DEFINITION 

SELECT OBJECT_DEFINITION(OBJECT_ID(N'Person.IndividualsWithEmail1',N'V'));
GO
--V = View object type

-- Step 6 - Alter the view to use WITH ENCRYPTION

ALTER VIEW Person.IndividualsWithEmail1
WITH ENCRYPTION
AS
SELECT p.BusinessEntityID, Title, FirstName, MiddleName, LastName 
FROM Person.Person AS p
JOIN Person.EmailAddress as e
on p.BusinessEntityID=e.BusinessEntityID;


-- Step 7 - Requery the view definition via OBJECT_DEFINITION

SELECT OBJECT_DEFINITION(OBJECT_ID(N'Person.IndividualsWithEmail',N'V'));
GO
--output:NULL
-- Step 8 - Drop the view

DROP VIEW Person.IndividualsWithEmail;
GO

-- Step 9 - Script the existing HumanResources.vEmployee view 
--          to a new query window and review its definition.

