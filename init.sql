--  СЛОЙ RAW

-- Создание таблицы "Продажи"
CREATE TABLE sales_raw (
    order_id SERIAL PRIMARY KEY,
    datatime TIMESTAMP,
    product_name VARCHAR(100),
    price_of_sale NUMERIC(10, 2),
    brand_name VARCHAR(50),
    category_name VARCHAR(50),
    promo_id INTEGER,
    cookies VARCHAR(100),
    sum_of_sale NUMERIC(10, 2)
);

-- Создание таблицы "ЛК покупателей"
CREATE TABLE customer_raw (
    customer_id SERIAL PRIMARY KEY,
    cookies VARCHAR(100),
    full_name VARCHAR(100),
    gender VARCHAR(10),
    birthday DATE,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Создание таблицы "Промо"
CREATE TABLE promo_raw (
    promo_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    date_start_promo DATE,
    date_end_promo DATE,
    discount NUMERIC(10, 2)
);

--  СЛОЙ CORE

CREATE TABLE gender (
    gender_id SERIAL PRIMARY KEY,
    gender VARCHAR(10) NOT NULL
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender_id INTEGER REFERENCES gender(gender_id),
    birthday DATE,
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2),
    brand_id INTEGER REFERENCES brand(brand_id),
    category_id INTEGER REFERENCES category(category_id)
);

CREATE TABLE promo (
    promo_id SERIAL PRIMARY KEY,
    date_start_promo DATE,
    date_end_promo DATE,
    discount NUMERIC(10, 2)
);

CREATE TABLE date_time (
    date_time_id SERIAL PRIMARY KEY,
    date_time TIMESTAMP,
    time TIME,
    date DATE,
    day_of_week INTEGER,
    week INTEGER,
    month INTEGER,
    quarter INTEGER,
    YEAR INTEGER
);

CREATE TABLE sales_fact (
    sales_id SERIAL,
    date_time_id INTEGER,
    product_id INTEGER,
    promo_id INTEGER,
    customer_id INTEGER,
    amount INTEGER,
    price_of_sale NUMERIC(10, 2),
    sum_of_sale NUMERIC(10, 2),
    PRIMARY KEY (sales_id, date_time_id, product_id, promo_id, customer_id),
    FOREIGN KEY (date_time_id) REFERENCES date_time(date_time_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (promo_id) REFERENCES promo(promo_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- Создаём представление для CORE-слоя
CREATE VIEW view_sales_raw AS
SELECT s.order_id, s.product_name, s.price_of_sale,
	   s.sum_of_sale, cr.customer_id, b.brand_id,
	   c.category_id, dt.date_time_id, pr.promo_id,
	   ROUND(s.sum_of_sale / s.price_of_sale, 0) AS amount,
	   CASE
		WHEN DATE(s.datetime_of_sale) < pr.date_start_promo THEN 0
		WHEN DATE(s.datetime_of_sale) > pr.date_end_promo THEN 0
	   ELSE pr.discount
	   END AS discount_of_sale
FROM sales_raw AS s
JOIN promo_raw AS pr ON s.product_name = pr.product_name
JOIN brand AS b ON s.brand_name = b.brand_name
JOIN category AS c ON s.category_name = c.category_name
JOIN date_time AS dt ON s.datetime_of_sale = dt.date_time
JOIN customer_raw AS cr ON cr.customer_cookies = s.customer_cookies;