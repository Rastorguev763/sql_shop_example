-- Создаем таблицы в базе данных
CREATE TABLE PUBLIC.products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10,2)
  );
    
CREATE TABLE PUBLIC.shops (
  shop_id SERIAL PRIMARY KEY,
  shop_name VARCHAR(255)
  );
  
CREATE TABLE PUBLIC.plan (
  product_id INT,
  shop_id INT,
  plan_cnt INT,
  plan_date DATE,
  FOREIGN KEY (product_id) REFERENCES public.products (product_id),
  FOREIGN KEY (shop_id) REFERENCES public.shops (shop_id)
  );
  
CREATE TABLE PUBLIC.shop_dns (
  shop_id INT,
  date DATE,
  product_id INT,
  sales_cnt DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES public.products (product_id),
  FOREIGN KEY (shop_id) REFERENCES public.shops (shop_id)
  );
 
CREATE TABLE PUBLIC.shop_mvideo (
  shop_id INT,
  date DATE,
  product_id INT,
  sales_cnt DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES public.products (product_id),
  FOREIGN KEY (shop_id) REFERENCES public.shops (shop_id)
  );
  
CREATE TABLE PUBLIC.shop_sitilink (
  shop_id INT,
  date DATE,
  product_id INT,
  sales_cnt DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES public.products (product_id),
  FOREIGN KEY (shop_id) REFERENCES public.shops (shop_id)
  );
  
-- Добавление записей в таблицу shops
INSERT INTO PUBLIC.shops (shop_name) VALUES ('shop_dns');
INSERT INTO PUBLIC.shops (shop_name) VALUES ('shop_mvideo');
INSERT INTO PUBLIC.shops (shop_name) VALUES ('shop_sitilink');

-- Добавление записей в таблицу products
INSERT INTO PUBLIC.products (product_name, price)
VALUES 
  ('Испорченный телефон', 100.00),
  ('Сарафанное радио', 500.00),
  ('Патефон', 1000.00);

-- Добавление записей в таблицу plan
INSERT INTO PUBLIC.plan (product_id, shop_id, plan_cnt, plan_date)
VALUES
  (1, 1, 10, '2023-06-30'),
  (2, 1, 20, '2023-06-30'),
  (3, 1, 30, '2023-06-30'),
  (1, 2, 15, '2023-06-30'),
  (2, 2, 25, '2023-06-30'),
  (3, 2, 35, '2023-06-30'),
  (1, 3, 5, '2023-06-30'),
  (2, 3, 10, '2023-06-30'),
  (3, 3, 15, '2023-06-30');

-- Добавление записей в таблицу shop_sitilink
INSERT INTO PUBLIC.shop_sitilink (shop_id, date, product_id, sales_cnt)
VALUES
  (3, '2023-01-10', 1, 8),
  (3, '2023-02-20', 2, 12),
  (3, '2023-03-25', 3, 18),
  (3, '2023-04-14', 1, 8),
  (3, '2023-05-12', 2, 12),
  (3, '2023-06-17', 3, 18),
  (3, '2023-01-26', 1, 8),
  (3, '2023-02-21', 2, 12),
  (3, '2023-03-28', 3, 18),
  (3, '2023-04-11', 1, 8),
  (3, '2023-05-04', 2, 12),
  (3, '2023-06-02', 3, 18),
  (3, '2023-04-08', 1, 8),
  (3, '2023-05-09', 2, 12),
  (3, '2023-06-30', 3, 18),
  (3, '2023-01-01', 1, 8),
  (3, '2023-02-11', 2, 12),
  (3, '2023-03-22', 3, 18);

-- Добавление записей в таблицу shop_mvideo
INSERT INTO PUBLIC.shop_mvideo (shop_id, date, product_id, sales_cnt)
VALUES
  (2, '2023-01-01', 1, 8),
  (2, '2023-02-12', 2, 12),
  (2, '2023-03-17', 3, 18),
  (2, '2023-04-23', 1, 8),
  (2, '2023-05-20', 2, 12),
  (2, '2023-06-12', 3, 18),
  (2, '2023-05-05', 2, 12),
  (2, '2023-06-13', 3, 18),
  (2, '2023-01-17', 1, 8),
  (2, '2023-02-02', 2, 12),
  (2, '2023-03-03', 3, 18);

-- Добавление записей в таблицу shop_dns
INSERT INTO PUBLIC.shop_dns (shop_id, date, product_id, sales_cnt)
VALUES
  (1, '2023-01-24', 1, 8),
  (1, '2023-02-18', 2, 12),
  (1, '2023-03-16', 3, 18),
  (1, '2023-04-03', 1, 8),
  (1, '2023-05-08', 2, 12),
  (1, '2023-06-15', 3, 18),
  (1, '2023-04-10', 1, 8);