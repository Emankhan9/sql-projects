
--   Walmart Sales Data Analysis
--   Dataset: 1000 rows | Source: WalmartSalesData.csv

-- 0. Preview Data

SELECT * 
FROM WalmartSalesDatacsv 
LIMIT 10;


-- 1. Data Quality Check (NULL Values)


SELECT COUNT(*) AS null_rows
FROM WalmartSalesDatacsv
WHERE c1  IS NULL OR c2  IS NULL OR c3  IS NULL OR c4  IS NULL
   OR c5  IS NULL OR c6  IS NULL OR c7  IS NULL OR c8  IS NULL
   OR c9  IS NULL OR c10 IS NULL OR c11 IS NULL OR c12 IS NULL
   OR c13 IS NULL OR c14 IS NULL OR c15 IS NULL OR c16 IS NULL
   OR c17 IS NULL;

-- Result: 0 NULL rows — dataset is complete and ready for analysis


-- Q1. Total Sales by Branch
-- Finding: Branch C has the highest sales (110,568.71)
--          Branch A (106,200.37) and Branch B (106,197.67) are very close

SELECT
    c2                    AS Branch,
    ROUND(SUM(c10), 2)    AS total_sales
FROM WalmartSalesDatacsv
WHERE c2 != 'Branch'
GROUP BY c2
ORDER BY total_sales DESC;


-- Q2. Best-Selling Product Lines (by Order Count)
-- Finding: Fashion Accessories is the top product (178 orders)
--          Health and Beauty is the lowest (152 orders)

SELECT
    c6              AS product_line,
    COUNT(*)        AS total_orders
FROM WalmartSalesDatacsv
WHERE c6 != 'Product line'
GROUP BY c6
ORDER BY total_orders DESC;


-- Q3. Most Used Payment Method
-- Finding: Ewallet (345) is most used, closely followed by Cash (344)
--          Credit Card is least used (311)

SELECT
    c13             AS payment_method,
    COUNT(*)        AS total_count
FROM WalmartSalesDatacsv
WHERE c13 != 'Payment'
GROUP BY c13
ORDER BY total_count DESC;


-- Q4. Shopping Frequency by Gender
-- Finding: Females shop slightly more (501) vs Males (499)
--          Difference is minimal — both genders shop almost equally

SELECT
    c5              AS gender,
    COUNT(*)        AS total_customers
FROM WalmartSalesDatacsv
WHERE c5 != 'Gender'
GROUP BY c5
ORDER BY total_customers DESC;


-- Q5. Average Customer Ratings by City
-- Finding: Naypyitaw has highest ratings (7.07)
--          Mandalay has lowest ratings (6.82)

SELECT
    c3                      AS city,
    ROUND(AVG(c17), 2)      AS avg_rating
FROM WalmartSalesDatacsv
WHERE c3 != 'City'
GROUP BY c3
ORDER BY avg_rating DESC;


-- Q6. Revenue: Member vs Normal Customers
-- Finding: Members generate more revenue (164,223) vs Normal (158,743)
--          Difference of ~5,480 shows membership program is beneficial

SELECT
    c4                          AS customer_type,
    ROUND(SUM(c10))             AS total_revenue
FROM WalmartSalesDatacsv
WHERE c4 != 'Customer type'
GROUP BY c4
ORDER BY total_revenue DESC;


-- Q7. Sales by Time of Day
-- Finding: Afternoon has the most sales (454)
--          Morning has the least sales (191)

SELECT
    CASE
        WHEN c12 < '12:00:00' THEN 'Morning'
        WHEN c12 < '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END                 AS time_of_day,
    COUNT(*)            AS total_sales
FROM WalmartSalesDatacsv
WHERE c12 != 'Time'
GROUP BY time_of_day
ORDER BY total_sales DESC;


-- Q8. Average Ratings by Product Line
-- Finding: Food and Beverages has highest rating (7.11)
--          Home and Lifestyle has the lowest (6.84)

SELECT
    c6                      AS product_line,
    ROUND(AVG(c17), 2)      AS avg_rating
FROM WalmartSalesDatacsv
WHERE c6 != 'Product line'
GROUP BY c6
ORDER BY avg_rating DESC;


-- Q9. Overall Sales Summary
-- Finding: 1000 total transactions | Total revenue: 322,967
--          Avg transaction: 323 | Min: 11 | Max: 100 | Avg rating: 7

SELECT
    COUNT(*)            AS total_transactions,
    ROUND(SUM(c10))     AS total_revenue,
    ROUND(AVG(c10))     AS avg_transaction,
    ROUND(MIN(c10))     AS lowest_sale,
    ROUND(MAX(c10))     AS highest_sale,
    ROUND(AVG(c17))     AS avg_customer_rating
FROM WalmartSalesDatacsv
WHERE c1 != 'Invoice ID';
