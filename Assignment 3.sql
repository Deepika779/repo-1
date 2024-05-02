1. Create a stored procedure to display the restaurant name, type and cuisine where thetable booking is not zero.CREATE PROCEDURE GetRestaurantsWithTableBooking
AS
BEGIN
    SELECT
        RestaurantName,
        RestaurantType,
        CuisinesType
    FROM
        JOMATO
    WHERE
        TableBooking > 0;
END;
SELECT * FROM dbo.GetTopRatedRestaurant();
EXEC GetRestaurantsWithTableBookingTask 2: Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback if necessary.

BEGIN TRANSACTION;
UPDATE JOMATO
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

-- Check the result
SELECT * FROM JOMATO WHERE CuisinesType = 'Cafeteria';

-- If necessary, rollback the transaction
-- ROLLBACK;


 3: Generate a row number column and find the top 5 areas with the 
 highest rating of restaurants.

WITH RankedAreas AS (
    SELECT
        Area,
        RANK() OVER (ORDER BY Rating DESC) AS Rank
    FROM
        JOMATO
)
SELECT
    Area,
    Rank
FROM
    RankedAreas
WHERE
    Rank <= 5;

 4.Use the while loop to display the numbers 1 to 50.

DECLARE @Counter INT = 1;

WHILE @Counter <= 50
BEGIN
    PRINT @Counter;
    SET @Counter = @Counter + 1;
END;

 5: Create a query to create a TopRating view to store the
 generated top 5 highest rating of restaurants.

CREATE VIEW TopRating AS
SELECT TOP 5
    RestaurantName,
    Rating
FROM
    JOMATO
ORDER BY
    Rating DESC;

Select * from TopRating

6. Create a trigger that gives a message whenever a new record is inserted.

CREATE TRIGGER OnInsertTrigger
ON JOMATO
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted.';
END;


SELECT * FROM jomato
SELECT * FROM InsertTrigger
