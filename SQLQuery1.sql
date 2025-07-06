create database KMS_db
select * from Orders


-------Question 1: Product with highest sales-----
Select Product_Category, SUM(Sales) as TotalSales
From Orders
Group by Product_Category
Order by TotalSales desc
-------Answer 1= Technology---------

----Question 2: Top and Bottom 3 regions by sales-----
Select Top 3 Region, SUM(Sales) as TotalSales
From Orders
Group by Region
Order by TotalSales desc
----answer: West, Ontario, Prarie-----

Select Top 3 Region, SUM(Sales) as TotalSales
From Orders
Group by Region
Order by TotalSales asc
----answer: Nunavut, Northwest Territories, Yukon---

-----Question 3: product category vs region vs sales---
Select Region, SUM(Sales) as TotalSales
From Orders
Where Product_Sub_Category = 'Appliances'
AND Region = 'Ontario'
Group By Region
-----answer: 202346.84----

-----Question 4: increase revenue for bottom 10 customers----
select * from Orders

Select Top 10 Customer_Name, 
              Discount, 
              SUM(Sales) as TotalSales
From Orders
Group by Customer_Name, Discount
Order by TotalSales asc

SELECT TOP 10 
    Customer_Name, 
    Ship_Mode,
    CONVERT(DECIMAL(5, 2), Discount) AS Discount_Formatted, 
    SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Customer_Name, Discount, Ship_Mode
ORDER BY TotalSales asc
-----answer: ----

-------Question 5: shipping cost vs ship mode
Select Ship_Mode, SUM(Shipping_Cost) as Total_Shiping_Cost
From Orders
Group by Ship_Mode
Order by Total_Shiping_Cost desc
-------answer: Delivery Truck-----

------Question 6: 
SELECT TOP 10
        Customer_Name, Product_Category,
        SUM(Sales) AS Total_CategorySales
FROM orders
GROUP BY Customer_Name, Product_Category
ORDER BY Total_CategorySales desc
--------answer:-----


-------Question 7------
SELECT Top 1
        Customer_Name, Customer_Segment, 
        SUM(Sales) AS TotalSales
FROM Orders
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name, Customer_Segment
ORDER BY TotalSales DESC
------answer: Dennis Kane-----

--------Question 8-----
SELECT Top 1
        Customer_Name, 
        Customer_Segment,
        COUNT(*) AS Order_Count
FROM Orders
WHERE Customer_Segment = 'Corporate'
        AND Year(Order_Date) BETWEEN '2009' AND '2012'
GROUP BY Customer_Name, Customer_Segment
ORDER BY Order_Count desc
-------answer: Coperate customer with most orders= Adam Hart-----


--------Question 9---------
SELECT Top 1
        Customer_Name, Customer_Segment, 
        SUM(Profit) as TotalProfit
From Orders
Where Customer_Segment = 'Consumer'
Group By Customer_Name, Customer_Segment
Order By TotalProfit desc
-----answer: Consumer customer with most profit= Emily Phan----

------Question 10------------
SELECT top 1 Customer_Name, Customer_Segment, Sum(Profit) as TotalNegative_Profit
FROM orders
WHERE Profit < 0 
Group by Customer_Name, Customer_Segment
Order by TotalNegative_Profit asc


------Question 11---------
SELECT 
    Ship_Mode, 
    Order_Priority,
    Sum(Shipping_Cost) as Total_Shipping_Cost,
    COUNT(*) AS Order_Count
FROM orders
GROUP BY 
    Ship_Mode, 
    Order_Priority,
   
ORDER BY 
    Ship_Mode, 
    Order_Priority, 
    Total_Shipping_Cost,
    Order_Count DESC

    SELECT 
    Ship_Mode, 
    Order_Priority,
    SUM(Shipping_Cost) AS Total_Shipping_Cost,
    COUNT(*) AS Order_Count
FROM orders
GROUP BY 
    Ship_Mode, 
    Order_Priority
ORDER BY 
    Ship_Mode, 
    Order_Priority, 
    Total_Shipping_Cost, 
    Order_Count DESC;

    -------delivery truck mode of shipping incurs more shipping cost with lesser order_count compared to that of express air---