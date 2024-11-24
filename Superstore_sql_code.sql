-- 1. What is the total sales amount for the business?
SELECT SUM(Sales) AS TotalSales FROM Superstore;

-- 2. How many orders have been placed in total?
SELECT COUNT(Order_ID) AS TotalOrders FROM Superstore;

-- 3. Which are the top 10 products by sales revenue?
SELECT Product_Name, SUM(Sales) AS TotalSales FROM Superstore GROUP BY Product_Name ORDER BY TotalSales DESC LIMIT 10;

-- 4. Which categories are performing best in terms of sales and profit?
SELECT Category, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit FROM Superstore GROUP BY Category ORDER BY TotalProfit DESC;

-- 5. Find all orders where the discount offered was greater than 20%.
SELECT * FROM Superstore WHERE Discount > 0.2;

-- 6. Identify regions where total profits were less than $100,000.
SELECT Region, SUM(Profit) AS TotalProfit FROM Superstore GROUP BY Region HAVING SUM(Profit) < 100000;

-- 7. Which products were sold at a loss?
SELECT Product_Name, SUM(Profit) AS TotalProfit FROM Superstore GROUP BY Product_Name HAVING TotalProfit < 0;

-- 8. Rank all customers by total sales they generated.
SELECT Customer_Name, SUM(Sales) AS TotalSales FROM Superstore GROUP BY Customer_Name ORDER BY TotalSales DESC;

-- 9. List the top 5 states by profit.
SELECT State, SUM(Profit) AS TotalProfit FROM Superstore GROUP BY State ORDER BY TotalProfit DESC LIMIT 5;

-- 10. What is the total sales contribution of each sub-category?
SELECT Sub_Category, SUM(Sales) AS TotalSales FROM Superstore GROUP BY Sub_Category ORDER BY TotalSales DESC;

-- 11. What is the average discount given across all orders?
SELECT AVG(Discount) AS AvgDiscount FROM Superstore;

-- 12. Find orders where sales were above $500 and profit margins were above 20%.
SELECT * FROM Superstore WHERE Sales > 500 AND Profit/Sales > 0.2;

-- 13. List all products that are in either the "Office Supplies" or "Technology" category.
SELECT * FROM Superstore WHERE Category IN ('Office Supplies', 'Technology');

-- 14. Identify customers who placed more than 5 orders but generated a profit less than $1,000.
SELECT Customer_Name, COUNT(Order_ID) AS Orders, SUM(Profit) AS TotalProfit FROM Superstore GROUP BY Customer_Name HAVING Orders > 5 AND TotalProfit < 1000;

-- 15. Find products where sales were greater than $9000 but a discount was not offered.
SELECT * FROM Superstore WHERE Sales > 9000 AND Discount = 0;

-- 16. Show all orders not shipped to the "East" region.
SELECT * FROM Superstore WHERE Region != 'East';

-- 17. Combine customer and region data to see total sales by customer and region.
SELECT Customer_Name, Region, SUM(Sales) AS TotalSales FROM Superstore GROUP BY Customer_Name, Region ORDER BY TotalSales DESC;

-- 18. Identify states with at least 3 different sub-categories of products sold.
SELECT State, COUNT(DISTINCT Sub_Category) AS SubCategories FROM Superstore GROUP BY State HAVING Sub_Category >= 3;

-- 19. Compare sales performance between "Consumer", "Corporate" and “Home Office” customer segments.
SELECT Segment, SUM(Sales) AS TotalSales FROM Superstore GROUP BY Segment;

-- 20. Show combined sales and profits for states with overlapping sales between furniture and office supplies.
SELECT State, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit FROM Superstore WHERE Category IN ('Furniture', 'Office Supplies') GROUP BY State;

-- 21. Which customer segment offers the best profit margins?
SELECT Segment, SUM(Profit)/SUM(Sales) AS ProfitMargin FROM Superstore GROUP BY Segment ORDER BY ProfitMargin DESC;

-- 22. Identify the impact of discounts on profit margins by sub-category.
SELECT Sub_Category, AVG(Discount) AS AvgDiscount, SUM(Profit)/SUM(Sales) AS ProfitMargin FROM Superstore GROUP BY Sub_Category;
