-- Заполняем данными RAW-слой

INSERT INTO customer_raw (customer_cookies, full_name, gender, birthday, email, phone)
VALUES
    ('cookie1', 'Иван Иванов', 'Мужской', '1999-01-01', 'ivan@mail.com', '1234567890'),
    ('cookie2', 'Анна Кошкина', 'Женский', '1995-05-15', 'anna@mail.com', '9876543210'),
    ('cookie3', 'Петр Петров', 'Мужской', '1989-09-30', 'petr@mail.com', '5555555555'),
    ('cookie4', 'Елена Листова', 'Женский', '2002-03-20', 'elena@mail.com', '1112223334'),
    ('cookie5', 'Михаил Лермонтов', 'Мужской', '1982-11-12', 'mikhail@mail.com', '9990001112'),
    ('cookie6', 'Ольга Новикова', 'Женский', '1995-07-08', 'olga@mail.com', '7778889990'),
    ('cookie7', 'Василий Пупкин', 'Мужской', '1989-04-25', 'alexey@mail.com', '4445556661'),


INSERT INTO promo_raw (product_name, date_start_promo, date_end_promo, discount)
VALUES
    ('Iphone 11', '2023-03-05', '2023-03-15', 10.00),
    ('Galaxy Buds2', '2023-04-01', '2023-04-15', 10.00),
    ('Iphone-11 PRO MAX', '2023-03-08', '2023-03-15', 10.00),
    ('Apple Watch 8', '2023-04-10', '2023-04-20', 30.00),
    ('Iphone-14 PRO MAX', '2023-05-01', '2023-05-07', 20.00),
    ('Iphone-14', '2023-03-25', '2023-04-05', 10.00),
    ('Airpods PRO', '2023-03-25', '2023-04-20', 20.00),
    ('Airpods 3', '2023-05-10', '2023-05-15', 50.00),
    ('Galaxy Watch6', '2023-04-20', '2023-04-25', 20.00),
    ('Samsung Galaxy S23', '2023-05-20', '2023-05-31', 10.00);

INSERT INTO sales_raw (datetime_of_sale, product_name, price_of_sale, brand_name, category_name, promo_id, customer_cookies, sum_of_sale)
VALUES
    ('2023-03-01 10:30:00', 'Iphone 11', 50000.00, 'Apple', 'Смартфоны', NULL, 'cookie1', 50000.00),
    ('2023-05-01 14:15:00', 'Galaxy Watch6', 20000.00, 'Samsung', 'Часы', NULL, 'cookie1', 40000.00),
    ('2023-04-20 09:45:00', 'Galaxy Watch6', 16000.00, 'Samsung', 'Часы', 1, 'cookie1', 32000.00),
    ('2023-03-15 11:30:00', 'Iphone-11 PRO MAX', 90000.00, 'Apple', 'Смартфоны', 2, 'cookie1', 90000.00),
    ('2023-04-05 09:45:00', 'Galaxy Buds2"', 9000.00, 'Samsung', 'Наушники', 3, 'cookie1', 9000.00),
    ('2023-03-02 15:30:00', 'Iphone-14', 90000.00, 'Apple', 'Смартфоны', NULL, 'cookie2', 90000.00),
    ('2023-04-03 12:00:00', 'Apple Watch 8', 40000.00, 'Apple', 'Часы', NULL, 'cookie2', 40000.00),
    ('2023-04-03 16:45:00', 'Airpods PRO', 16000.00, 'Apple', 'Наушники', 4, 'cookie2', 16000.00),
    ('2023-04-08 09:45:00', 'Galaxy Watch6', 20000.00, 'Samsung', 'Часы', 5, 'cookie2', 20000.00),
    ('2023-04-12 10:30:00', 'Iphone-14', 81000.00, 'Apple', 'Смартфоны', 6, 'cookie2', 81000.00),
    ('2023-03-04 11:15:00', 'Samsung Galaxy S23', 120000.00, 'Samsung', 'Смартфоны', NULL, 'cookie3', 120000.00),
    ('2023-05-05 09:30:00', 'Airpods 3', 15000.00, 'Apple', 'Наушнки', NULL, 'cookie3', 15000.00),
    ('2023-03-06 13:45:00', 'Iphone-14 PRO MAX', 140000.00, 'Apple', 'Смартфоны', NULL, 'cookie3', 140000.00),
    ('2023-05-05 13:45:00', 'Airpods 3', 7500.00, 'Apple', 'Наушники', 7, 'cookie3', 7500.00),
    ('2023-04-05 16:30:00', 'Airpods PRO', 16000.00, 'Apple', 'Наушники', 8, 'cookie3', 16000.00),
    ('2023-03-06 16:30:00', 'Apple Watch 8', 40000.00, 'Apple', 'Часы', NULL, 'cookie4', 40000.00),
    ('2023-05-25 11:15:00', 'Samsung Galaxy S23', 10800.00, 'Samsung', 'Смартфоны', 9, 'cookie4',10800.00),
    ('2023-04-11 09:30:00', 'Airpods PRO', 16000.00, 'Apple', 'Наушники', 10, 'cookie4', 16000.00),
    ('2023-04-07 10:30:00', 'Iphone-14 PRO MAX', 140000.00, 'Apple', 'Смартфоны', NULL, 'cookie5', 140000.00),
    ('2023-05-07 14:15:00', 'Apple Watch 8', 28000.00, 'Apple', 'Часы', 11, 'cookie5', 56000.00),
    ('2023-04-25 13:45:00', 'Iphone-14 PRO MAX', 140000.00, 'Apple', 'Смартфоны', NULL, 'cookie5', 280000.00),
    ('2023-04-25 14:15:00', 'Galaxy Watch6', 16000.00, 'Samsung', 'Наушнки', 12, 'cookie6', 16000.00),
    ('2023-03-08 15:30:00', 'Iphone-14', 90000.00, 'Apple', 'Смартфоны', NULL, 'cookie6', 90000.00),

-- Преобразуем RAW и заполняем CORE слои 

INSERT INTO gender (gender)
SELECT DISTINCT gender
FROM customer_raw;

INSERT INTO customer (customer_id, full_name, gender_id, birthday, email, phone)
SELECT c.customer_id, c.full_name, g.gender_id, c.birthday, c.email, c.phone
FROM customer_raw AS c
JOIN gender AS g USING(gender)
ORDER BY customer_id;

INSERT INTO promo (promo_id, date_start_promo, date_end_promo, discount)
SELECT DISTINCT promo_id, date_start_promo, date_end_promo, discount
FROM promo_raw
ORDER BY promo_id;

INSERT INTO date_time (date_time, "time", "date", day_of_week, "week", "month", "quarter", "year")
SELECT dt.datetime_of_sale,
		CAST(dt.datetime_of_sale AS TIME) AS "time",
		DATE(dt.datetime_of_sale) AS "date",
		EXTRACT(ISODOW FROM dt.datetime_of_sale) AS "day_of_week",
        EXTRACT(WEEK FROM dt.datetime_of_sale) AS "week",
		EXTRACT(MONTH FROM dt.datetime_of_sale) AS "month",
		EXTRACT(QUARTER FROM dt.datetime_of_sale) AS "quarter",
		EXTRACT(YEAR FROM dt.datetime_of_sale) AS "year"
FROM (SELECT DISTINCT datetime_of_sale FROM sales_raw) AS dt;

INSERT INTO brand (brand_name)
SELECT DISTINCT brand_name
FROM sales_raw;

INSERT INTO category (category_name)
SELECT DISTINCT category_name
FROM sales_raw;

INSERT INTO product (product_name, brand_id, category_id, price)
SELECT DISTINCT product_name, brand_id, category_id,
				ROUND(price_of_sale * 100 / (100 - discount_of_sale), 2) AS price
FROM view_sales_raw;


INSERT INTO sales_fact (date_time_id, product_id, promo_id, customer_id, amount, price_of_sale, sum_of_sale)
SELECT vs.date_time_id, pr.product_id, vs.promo_id, vs.customer_id,
	   vs.amount, vs.price_of_sale, vs.sum_of_sale
FROM view_sales_raw AS vs
JOIN product AS pr USING(product_name)
ORDER BY vs.order_id;