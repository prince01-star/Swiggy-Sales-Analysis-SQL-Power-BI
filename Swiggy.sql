use Swiggy_Analysis;
go

select * from fact_orders;
go
EXEC sp_rename 'fact_orders.food_id', 'dish_id', 'COLUMN';
go
select * from dim_date;
go
select * from dim_dish;
go
select * from dim_restaurant
go
select * from dim_location;
go
ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_restaurant
FOREIGN KEY (restaurant_id)
REFERENCES dim_restaurant(restaurant_id);
Go
ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_dish
FOREIGN KEY (dish_id)
REFERENCES dim_dish(dish_id);
go

ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);
go

ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_location
FOREIGN KEY (location_id)
REFERENCES dim_location(location_id);
go


--CHECKING THE CONNECTION BETWEEN FACT_TABLE AND DIM_TABLE .
SELECT 
    f.order_id,
    r.restaurant_name,
    d.dish_name,
    l.city,
    l.location,
    dt.order_date,
    f.price,
    f.rating
FROM fact_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
JOIN dim_dish d ON f.dish_id = d.dish_id
JOIN dim_date dt ON f.date_id = dt.date_id
JOIN dim_location l ON f.location_id = l.location_id;
go

SELECT 
    SUM(price) AS total_revenue
FROM fact_orders;
GO


SELECT 
    COUNT(order_id) AS total_orders
FROM fact_orders;
GO

SELECT 
    AVG(rating) AS avg_rating
FROM fact_orders;
GO

SELECT TOP 10
    d.dish_name,
    COUNT(f.order_id) AS total_orders,
    SUM(f.price) AS revenue
FROM fact_orders f
JOIN dim_dish d ON f.dish_id = d.dish_id
GROUP BY d.dish_name
ORDER BY total_orders DESC;
GO

SELECT 
    r.restaurant_name,
    COUNT(f.order_id) AS total_orders,
    SUM(f.price) AS revenue
FROM fact_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_orders DESC;
GO


SELECT 
    l.city,
    COUNT(f.order_id) AS total_orders,
    SUM(f.price) AS revenue
FROM fact_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY total_orders DESC;
GO

SELECT 
    YEAR(dt.order_date) AS year,
    MONTH(dt.order_date) AS month,
    COUNT(f.order_id) AS total_orders,
    SUM(f.price) AS revenue
FROM fact_orders f
JOIN dim_date dt ON f.date_id = dt.date_id
GROUP BY YEAR(dt.order_date), MONTH(dt.order_date)
ORDER BY year, month;
GO

SELECT 
    r.restaurant_name,
    AVG(f.rating) AS avg_rating
FROM fact_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY avg_rating DESC;
GO

SELECT 
    r.restaurant_name,
    COUNT(f.order_id) AS total_orders,
    AVG(f.rating) AS avg_rating
FROM fact_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(f.order_id) > 5
ORDER BY avg_rating DESC;
GO


INSERT INTO fact_orders (
    order_id,
    date_id,
    location_id,
    restaurant_id,
    dish_id,
    price,
    rating,
    rating_count
)
VALUES (
    197431,        -- new order_id
    105,        -- existing date_id
    989,        -- existing location_id
    993,        -- existing restaurant_id
    8281,        -- existing dish_id
    120,      -- price
    4.2,      -- rating
    10        -- rating_count
);
go

ALTER TABLE dim_date
ADD year INT;
go

UPDATE dim_date
SET year = YEAR(order_date);
go

ALTER TABLE dim_date
ADD month INT;
go

UPDATE dim_date
SET month = MONTH(order_date);
go

ALTER TABLE dim_date
ADD month_name VARCHAR(20);
go

UPDATE dim_date
SET month_name = DATENAME(MONTH, order_date);
go