---view of the data from each table 
SELECT * FROM sales.customers;
SELECT*FROM sales.date;
SELECT*FROM sales.markets;
SELECT*FROM sales.products;
select*from sales.transactions;

---1. List all customer names along with their types.
select custmer_name ,customer_type from sales.customers;

---2. Retrieve the list of product codes and their types
select product_code,product_type from sales.products;

---3. Calculate the total sales quantity and sales amount for each product type
select sales.p.product_type, sum(sales.t.sales_qty) as total_sales, sum(sales.t.sales_amount) as total_amount
from sales.transactions as t inner join sales.products as p
on sales.t.product_code=sales.p.product_code
group by p.product_type

---4. Determine the total sales amount and count of transactions for each year.
SELECT YEAR(order_date) AS sales_year, COUNT(*) AS transaction_count, SUM(sales_amount) AS total_sales_amount
FROM sales.transactions
GROUP BY YEAR(order_date)
ORDER BY sales_year;

---5. Find the average sales quantity and sales amount per customer type
SELECT c.customer_type,
       AVG(t.sales_qty) AS avg_sales_quantity,
       AVG(t.sales_amount) AS avg_sales_amount
FROM sales.customers c
JOIN sales.transactions t ON c.customer_code = t.customer_code
GROUP BY c.customer_type;

---6. Find the total sales quantity and sales amount for each customer along with their names and types.
select c.custmer_name,c.customer_type,sum(t.sales_qty) as sum_sales_qty ,sum(t.sales_amount) as sum_sales_amount
from sales.customers as c inner join sales.transactions as t
on c.customer_code=t.customer_code
group by custmer_name,customer_type;

---7. Get the product names, sales quantity, and sales amount for each transaction
select p.product_code,sum(t.sales_qty),sum(t.sales_amount)
from sales.products as p inner join sales.transactions as t
on p.product_code=t.product_code
group by p.product_code;

---8. List all transactions with customer names, product names, and market names
SELECT c.custmer_name, p.product_code, m.markets_name, t.sales_qty, t.sales_amount
FROM sales.transactions AS t
JOIN sales.customers AS c ON t.customer_code = c.customer_code
JOIN sales.products AS p ON t.product_code = p.product_code
JOIN sales.markets AS m ON t.market_code = m.markets_code;

---9. Calculate the total sales amount for each month in a specific year
SELECT MONTH(order_date) AS sales_month,
       SUM(sales_amount) AS total_sales_amount
FROM sales.transactions
WHERE YEAR(order_date) = 2020
GROUP BY MONTH(order_date)
ORDER BY sales_month;

----10. Determine the year with the highest total sales amount.
SELECT YEAR(order_date) AS sales_year, SUM(sales_amount) as total_amount
FROM sales.transactions
GROUP BY YEAR(order_date)
ORDER BY total_amount DESC
LIMIT 1;







