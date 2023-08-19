-- Продажи по клиентам
CREATE MATERIALIZED VIEW IF NOT EXISTS sales_by_customers_data_mart AS
SELECT sf.customer_id, c.full_name, g.gender, c.phone,
	   sf.sum_of_sale, sf.amount
FROM sales_fact AS sf
JOIN customer AS c ON sf.customer_id = c.customer_id
JOIN gender AS g ON c.gender_id = g.gender_id
ORDER BY sf.customer_id;

-- Продажи по неделям и с учётом базовых цен и промо
CREATE MATERIALIZED VIEW IF NOT EXISTS sales_by_week_data_mart AS
SELECT dt."week", sf.sum_of_sale, p.price * sf.amount AS sales_by_price
FROM sales_fact AS sf
JOIN date_time AS dt ON sf.date_time_id = dt.date_time_id
JOIN product AS p ON sf.product_id = p.product_id
JOIN category AS c ON p.category_id = c.category_id
ORDER BY dt."week", c.category_name;

-- Продажи по дням и категориям
CREATE MATERIALIZED VIEW IF NOT EXISTS sales_by_date_data_mart AS
SELECT s."date" AS "Дата продажи",
	   CASE WHEN MAX(s.smartphone) IS NULL THEN 0 ELSE MAX(s.smartphone) END AS " Смартфоны",
	   CASE WHEN MAX(s.watch) IS NULL THEN 0 ELSE MAX(s.watch) END AS "Часы",
	   CASE WHEN MAX(s.headphones) IS NULL THEN 0 ELSE MAX(s.headphones) END AS "Наушники"
FROM (
	SELECT dt."date", c.category_name, sf.sum_of_sale,
		   SUM(sf.sum_of_sale) FILTER(WHERE c.category_name = 'Смартфоны') OVER w AS smartphone,
		   SUM(sf.sum_of_sale) FILTER(WHERE c.category_name = 'Часы') OVER w AS watch,
		   SUM(sf.sum_of_sale) FILTER(WHERE c.category_name = 'Наушники') OVER w AS headphones
	FROM sales_fact AS sf
	JOIN date_time AS dt ON sf.date_time_id = dt.date_time_id
	JOIN product AS p ON sf.product_id = p.product_id
	JOIN category AS c ON p.category_id = c.category_id
	WINDOW w AS (PARTITION BY dt."date")
	ORDER BY dt."date", c.category_name
) AS s
GROUP BY s."date"
ORDER BY s."date";