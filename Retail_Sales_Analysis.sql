USE retail_analytics;
SHOW tables;

-- Sales_data_loaded

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
SaleID,
@SaleDate,
StoreID,
ProductID,
Category,
CostPrice,
UnitPrice,
DiscountPercent,
Quantity,
TotalAmount,
PaymentMode
)
SET SaleDate = STR_TO_DATE(@SaleDate, '%d-%m-%Y');

-- Product_data_csv

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/product_data.csv'
INTO TABLE product_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Store_data_CSV
 
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/store_data.csv'
INTO TABLE store_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inventory_data_Csv

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/inventory_data.csv'
INTO TABLE inventory_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
@InventoryDate,
StoreID,
ProductID,
OpeningStock,
StockIn,
StockOut,
ClosingStock,
@ignore
)
SET InventoryDate = STR_TO_DATE(@InventoryDate, '%d-%m-%Y');


SELECT COUNT(*) FROM inventory_data;
SELECT COUNT(*) FROM product_data;
SELECT COUNT(*) FROM sales_data;
SELECT COUNT(*) FROM store_data;


-- 1 Total Revenue (Business Health)
SELECT SUM(TotalAmount) AS Total_Revenue FROM sales_data

-- 2 Revenue by region
SELECT
    st.Region,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
JOIN store_data st
ON sd.StoreID = st.StoreID
GROUP BY st.Region
ORDER BY Revenue DESC;

-- 3 Top 5 Performing Stores
-- Question: Which stores contribute the most revenue?

SELECT 
    sd.StoreID,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
GROUP BY sd.StoreID
ORDER BY Revenue DESC
LIMIT 5;

-- 4 Bottom 5 Stores (Underperformance Detection)
-- Question: Which stores need improvement?

SELECT 
    sd.StoreID,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
GROUP BY sd.StoreID
ORDER BY Revenue ASC
LIMIT 5;

-- 5 Category Contribution to Revenue
-- Question: Which product category drives the business?

SELECT 
    pd.Category,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
JOIN product_data pd
ON sd.ProductID = pd.ProductID
GROUP BY pd.Category
ORDER BY Revenue DESC;

-- 6 Top 10 Best-Selling Products
-- Question: Which products sell the most units?

SELECT 
    sd.ProductID,
    SUM(sd.Quantity) AS Units_Sold
FROM sales_data sd
GROUP BY sd.ProductID
ORDER BY Units_Sold DESC
LIMIT 10;

-- 7 Stockout Risk Products (Revenue Loss Risk)
-- Question: Which products are close to stockout?

SELECT 
    StoreID,
    ProductID,
    ClosingStock
FROM inventory_data
WHERE ClosingStock < 20
ORDER BY ClosingStock ASC;

-- 8 Overstocked Products (Blocked Capital)
-- Question: Which products are overstocked and not moving?

SELECT 
    ProductID,
    AVG(ClosingStock) AS Avg_Stock
FROM inventory_data
GROUP BY ProductID
HAVING Avg_Stock > 120;

-- 9 Inventory Turnover (Operational Efficiency)
-- Question: How efficiently is inventory being sold?

SELECT 
    ProductID,
    ROUND(SUM(StockOut) / AVG(OpeningStock), 2) AS Inventory_Turnover
FROM inventory_data
GROUP BY ProductID
ORDER BY Inventory_Turnover DESC;

-- 10 Monthly Sales Trend (Seasonality Analysis)
-- Question: How does revenue change month-by-month?

SELECT 
    DATE_FORMAT(SaleDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS Revenue
FROM sales_data
GROUP BY Month
ORDER BY Month;

-- 11 Discount Impact on Revenue
-- Question: Which discount levels generate the most revenue?

SELECT 
    DiscountPercent,
    SUM(TotalAmount) AS Revenue
FROM sales_data
GROUP BY DiscountPercent
ORDER BY DiscountPercent;

-- 12 High Discount – Low Profit Risk
-- Question: Are high discounts hurting profitability?

SELECT 
    sd.DiscountPercent,
    SUM(sd.TotalAmount - (sd.Quantity * pm.CostPrice)) AS Profit
FROM sales_data sd
JOIN product_data pd
ON sd.ProductID = pd.ProductID
GROUP BY sd.DiscountPercent
ORDER BY sd.DiscountPercent;

-- 13 Store Size vs Revenue
-- Question: large stores perform better than small ones?

SELECT 
    st.StoreSize,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
JOIN store_data st
ON sd.StoreID = st.StoreID
GROUP BY st.StoreSize;

-- 14 Fast-Moving Products (Reorder Priority)
-- Question: Which products sell fast and need frequent restocking?

SELECT 
    sd.ProductID,
    SUM(sd.Quantity) AS Units_Sold
FROM sales_data sd
GROUP BY sd.ProductID
HAVING Units_Sold > 500
ORDER BY Units_Sold DESC;

-- 15 City-Wise Revenue (Geo Performance)
-- Question: Which cities generate the most revenue?

SELECT 
    st.City,
    SUM(sd.TotalAmount) AS Revenue
FROM sales_data sd
JOIN store_data st
ON sd.StoreID = st.StoreID
GROUP BY st.City
ORDER BY Revenue DESC;


