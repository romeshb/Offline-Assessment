# Solution by Romesh Borawake, borawakeromesh@gmail.com

Create	Database countrysales1;
Use countrysales1;

create table sales_table (Sale_date varchar(20), 
Country varchar(20),
Category varchar(20),
product varchar(20),
sales int);

insert into sales_table values
('Jan-2021', 'USA' , 'Retail', 'UUID1', 10000),
('Jan-2021', 'USA', 'Healthcare', 'UUID2', 2000),
('Jan-2021', 'Canada', 'Retail', 'UUID3', 30000),
('Jan-2021', 'Canada', 'Hospitality', 'UUID4', 5000),
('Feb-2021', 'USA' , 'Retail', 'UUID5', 10000),
('Feb-2021', 'USA', 'Healthcare', 'UUID6', 2000),
('Feb-2021', 'Canada', 'Retail', 'UUID7', 30000),
('Feb-2021', 'Canada', 'Hospitality', 'UUID8', 5000);

Select * From sales_table;

-- We extract year and month from Sale_date
ALTER TABLE sales_table
ADD Sale_month varchar(10),
ADD Sale_year INT;

UPDATE sales_table
SET
Sale_month = SUBSTRING(Sale_date, 1, 3),
Sale_year = SUBSTRING(Sale_date, 5, 4);

-- Now we can drop the old column Sale_date
ALTER TABLE sales_table
DROP COLUMN Sale_date;

#=======================================================================
#Q1
-- 1.Top 3 categories within every country based on total sales in the current year.
--     Output should be in this format (Country, Category, Total sales)


# Query with current year will return empty output as current year 2022 not in sales_table.
SELECT Country, Category, total_sales
FROM 
(SELECT Country, Category, total_sales,
row_number() over(partition by Country order by total_sales desc) as rw
From
(Select Country, Category, sales,
(Sum(sales) Over (partition by Sale_year, Country, Category)) as total_sales
FROM sales_table Where Sale_year = Year(curdate())  ) as t2
Group By Country, Category) as t3
WHERE rw <= 3;

-- This query can be used to get Top 3 Categories within each 
-- country based on Total sales in each year.

SELECT Country, Category, total_sales
FROM 
(SELECT Country, Category, total_sales,
row_number() over (partition by Country order by total_sales desc) as rw
From
(Select Country, Category, sales,
(Sum(sales) Over (partition by Sale_year, Country, Category)) as total_sales
FROM sales_table ) as t2
Group By Country, Category) as t3
WHERE rw <= 3;

#=======================================================================
#Q2
-- 2. Total sales of products sold in both Feb & Jan , Total sales of products sold ONLY in Jan, 
-- Total sales of products sold ONLY in Feb.
--     Output should be in this format (jan_feb_sales, jan_sales, feb_sales)

# treating each select query as a column
SELECT 
(SELECT sum(sales) as jan_feb_sales
FROM sales_table
WHERE Sale_month ='Feb' OR Sale_month ='Jan') as jan_feb_sales,

(SELECT sum(sales) as jan_sales
FROM sales_table
WHERE Sale_month ='Jan'
group by Sale_month) as jan_sales,

(SELECT sum(sales) as feb_sales
FROM sales_table
WHERE Sale_month ='Feb'
Group by Sale_month) as feb_sales;

#=======================================================================
#Q3
-- 3. In the query written in question #1 what are the partitions and 
-- indexes you would create for best performance? 
-- Ans:
-- The Partitions I created were Sale_year, Country and Category for best perfomance,
-- because, We can say that Sale year is least Heterogeneous in the current table, 
-- followed by Country and then by Category.

#==========================END OF FILE====================================



