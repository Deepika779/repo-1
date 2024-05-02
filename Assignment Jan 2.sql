1.Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.

Create FUNCTION ChickenStuff (@inputString VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @result VARCHAR(MAX)
    SET @result = STUFF(@inputString,7, 7, 'Chicken bites')
    RETURN @result
END

SELECT dbo.Chickenstuff('Quick Bites')

2.Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.

CREATE FUNCTION dbo.GetTopRatedRestaurant()
RETURNS @Result TABLE (
    RestaurantName NVARCHAR(100),
    CuisinesType NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT TOP 1 RestaurantName, CuisinesType
    FROM jomato
    ORDER BY No_of_Rating DESC;
    
    RETURN;
END;

SELECT * FROM dbo.GetTopRatedRestaurant();


3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating.


SELECT 
  rating,
  CASE
    WHEN rating > 4 THEN 'Excellent'
    WHEN rating > 3.5 THEN 'Good'
    WHEN rating > 3 THEN 'Average'
    ELSE 'Bad'
  END AS rating_status
FROM
  Jomato;

4. Find the Ceil, floor and absolute values of the rating column and display the current date
and separately display the year, month_name and day.

SELECT Rating,
    CEILING(Rating) AS CeilValue,
    FLOOR(Rating) AS FloorValue,
    ABS(Rating) AS AbsoluteValue,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS CurrentYear,
    DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
    DAY(GETDATE()) AS CurrentDay
    from jomato


5. Display the restaurant type and total average cost using rollup.

SELECT RestaurantType, SUM(AverageCost) as TotalAverageCost
FROM Jomato
GROUP BY RestaurantType WITH ROLLUP;
