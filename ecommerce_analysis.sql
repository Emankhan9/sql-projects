-- E-Commerce Customer Behavior & Sales Analysis (2024)
-- Dataset: 17,049 rows | Source: Kaggle


-- Preview Data

SELECT * 
FROM ecommerce_customer_behavior_dataset_v2 
LIMIT 10;


-- Q1. Which product category has the highest total revenue?
-- Finding: Electronics has the highest revenue of 10,481,897.65

SELECT 
    Product_Category,
    ROUND(SUM(Total_Amount), 2) AS total_revenue
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- Q2. Which month had the most sales?
-- Finding: January (Month 01) has the highest sales record of 6,905 units

SELECT 
    strftime('%m', Date) AS months,
    ROUND(SUM(Quantity), 2) AS sales
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY months
ORDER BY sales DESC;


-- Q3. Overall sales summary
-- Finding: Total orders: 17,049 | Total revenue: 21,779,052.59 | Avg order value: 1,277.44

SELECT 
    COUNT(Order_ID)             AS total_orders,
    ROUND(SUM(Total_Amount), 2) AS total_revenue,
    ROUND(AVG(Total_Amount), 2) AS avg_order_value
FROM ecommerce_customer_behavior_dataset_v2;


-- Q4. Which age group shops the most?
-- Finding: Age group 36-50 has the highest sales (19,596), followed by 26-35 (15,595)

SELECT 
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age <= 35 THEN '26-35'
        WHEN Age <= 50 THEN '36-50'
        WHEN Age > 50  THEN '50+'
    END                        AS age_group,
    ROUND(SUM(Quantity), 2)    AS sales
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY age_group
ORDER BY sales DESC;


-- Q5. Do male or female customers spend more on average?
-- Finding: Other gender category has the highest avg spending (1,530.32)

SELECT 
    Gender,
    ROUND(AVG(Total_Amount), 2) AS avg_spending
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Gender
ORDER BY avg_spending DESC;


-- Q6. Which city has the highest total revenue?
-- Finding: Istanbul has the highest total revenue of 5,646,595.78

SELECT 
    City,
    ROUND(SUM(Total_Amount), 2) AS total_revenue
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY City
ORDER BY total_revenue DESC;


-- Q7. Which payment method is used the most?
-- Finding: Credit Card is the most used payment method (~6,801 transactions)

SELECT 
    Payment_Method,
    COUNT(Payment_Method) AS payment_method_used
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Payment_Method
ORDER BY payment_method_used DESC;


-- Q8. Do mobile or desktop users place more orders?
-- Finding: Mobile users place more orders (9,543)

SELECT 
    Device_Type,
    COUNT(Device_Type) AS orders_count
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Device_Type
ORDER BY orders_count DESC;


-- Q9. Which product category gets the highest discount on average?
-- Finding: Electronics has the highest average discount of 273.95

SELECT 
    Product_Category,
    ROUND(AVG(Discount_Amount), 2) AS avg_discount
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Product_Category
ORDER BY avg_discount DESC;


-- Q10. Which product category has the highest customer rating?
-- Finding: Home & Garden has the highest average rating of 3.93

SELECT 
    Product_Category,
    ROUND(AVG(Customer_Rating), 2) AS avg_rating
FROM ecommerce_customer_behavior_dataset_v2
GROUP BY Product_Category
ORDER BY avg_rating DESC;
