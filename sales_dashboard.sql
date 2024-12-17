--Rows count--
SELECT COUNT(*) AS total_rows FROM cleaned_sales_data;

--Column statistics--
SELECT 
	COUNT(*) AS total_rows, 
	COUNT(DISTINCT InvoiceNo) AS unique_invoice,
	COUNT(DISTINCT CustomerID) AS unique_customers
 FROM cleaned_sales_data;

--Preview top rows--
SELECT * FROM cleaned_sales_data LIMIT 10;

--Sales Trend Over Time--
SELECT
	DATE_TRUNC('month', InvoiceDate) AS sales_month,
	SUM(Quantity * UnitPrice) AS total_sales
 FROM cleaned_sales_data
 GROUP BY sales_month
 ORDER BY sales_month;

--Peak Sales Hours--
SELECT
	EXTRACT(hour FROM InvoiceDate) AS sales_hour,
	COUNT(*) AS transaction_count
 FROM cleaned_sales_data
 GROUP BY sales_hour
 ORDER BY transaction_count DESC;

--Top Customer by total sales--
SELECT
	CustomerID,
	SUM(Quantity * UnitPrice) AS total_spent
 FROM cleaned_sales_data
 GROUP BY CustomerID
 ORDER BY total_spent DESC
 LIMIT 10;

--Finding out High value customers--
SELECT
	CustomerID,
	SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
 FROM cleaned_sales_data
 GROUP BY CustomerID
 ORDER BY avg_order_value DESC;

--Top Selling Products--
SELECT
	StockCode,
	Description,
	SUM(Quantity) AS total_quantity
 FROM cleaned_sales_data
 GROUP BY StockCode, Description
 ORDER BY total_quantity DESC
 LIMIT 10;

--Top products by revenue--
SELECT
	StockCode,
	Description,
	SUM(Quantity * UnitPrice) AS total_revenue
 FROM cleaned_sales_data
 GROUP BY StockCode, Description
 ORDER BY total_revenue DESC
 LIMIT 10;

--Top country by revenue--
 SELECT 
    Country,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM cleaned_sales_data
GROUP BY Country
ORDER BY total_revenue DESC;

--Number of transactions per country--
SELECT 
    Country,
    COUNT(DISTINCT InvoiceNo) AS transaction_count
FROM cleaned_sales_data
GROUP BY Country
ORDER BY transaction_count DESC;

--Identifying records with Incorrect UnitPrice--
SELECT * FROM cleaned_sales_data 
WHERE UnitPrice <= 0;

--Identifying records
SELECT * FROM cleaned_sales_data WHERE quantity <= 0;


--Identifying repeated customers--
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceDate) AS num_purchases
FROM cleaned_sales_data
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceDate) > 1
ORDER BY num_purchases DESC
LIMIT 10;

--Total number of cancellations vs Total number of transactions
SELECT
    COUNT(*) FILTER (WHERE InvoiceNo LIKE 'C%') AS cancellations,
    COUNT(*) AS total_transactions
FROM cleaned_sales_data;

--Total number of unique original invoices vs unique cancelled invoice--
SELECT
    COUNT(DISTINCT InvoiceNo) AS original_invoices,
    COUNT(DISTINCT InvoiceNo) FILTER (WHERE InvoiceNo LIKE 'C%') AS cancelled_invoices 
FROM cleaned_sales_data;

--Number of cancellation each customer has made--
SELECT
    CustomerID,
    COUNT(InvoiceNo) AS num_cancellations
FROM cleaned_sales_data
WHERE InvoiceNo LIKE 'C%'
GROUP BY CustomerID
ORDER BY num_cancellations DESC;

--Products that are most frequently cancelled--
SELECT
    StockCode,
    Description,
    COUNT(InvoiceNo) AS cancellations_count
FROM cleaned_sales_data
WHERE InvoiceNo LIKE 'C%'
GROUP BY StockCode, Description
ORDER BY cancellations_count DESC;

--Analyzing cancellations with respect to time--
SELECT
    EXTRACT(month FROM InvoiceDate) AS month,
    COUNT(InvoiceNo) AS cancellations_count
FROM cleaned_sales_data
WHERE InvoiceNo LIKE 'C%'
GROUP BY month
ORDER BY cancellations_count DESC;

