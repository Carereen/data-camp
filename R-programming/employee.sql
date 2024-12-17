CREATE TABLE employee (
  id INT UNIQUE, 
  firstname TEXT,
  lastname TEXT,
  staff TEXT,
  salary REAL
);

INSERT INTO employee VALUES 
  (1, 'Andrew', 'Adams', 'manager', 35000),
  (2, 'Nancy', 'Edwards', 'chef', 28000),
  (3, 'Jane', 'Peacock', 'waiter', 18000),
  (4, 'Margaret', 'Park', 'waiter', 18000),
  (5, 'Michael', 'Mitchell', 'waiter', 18000);

CREATE TABLE menu (
  id INT UNIQUE,
  food_drink TEXT,
  price REAL,
  ingredient TEXT
);

INSERT INTO menu VALUES
  (1, 'poke', 150, 'tuna, onion, scallion'),
  (2, 'carne asada fries', 180, 'beaf, potato, avocado'),
  (3, 'etouffee', 200, 'shrimps, onion, garlic'),
  (4, 'pasta', 100, 'spaghetti, onion, milk'),
  (5, 'salad', 100, 'tomato, onion, olives'),
  (6, 'strawberry smoothie', 70, 'strawberries, milk, yogurt'),
  (7, 'blue hawaiian', 70, 'blue curacao, pineapple juice, cream of coconut'),
  (8, 'watermelon juice', 70, 'watermelon, Lime, mint leaves');


CREATE TABLE orders (
  order_id INT UNIQUE,
  menu INT,
  date TEXT,
  customer_male INT,
  customer_female INT,
  staff INT 
);

INSERT INTO orders VALUES
  (1, 2, '2024-07-01', 3, 0, 3),
  (2, 4, '2024-07-01', 2, 3, 5),
  (3, 2, '2024-07-01', 1, 0, 3),
  (4, 2, '2024-07-02', 2, 6, 3),
  (5, 7, '2024-07-03', 3, 2, 5),
  (6, 2, '2024-07-05', 2, 1, 4),
  (7, 5, '2024-07-05', 0, 2, 3),
  (8, 2, '2024-07-05', 2, 2, 4),
  (9, 8, '2024-07-06', 0, 1, 4),
  (10, 2, '2024-07-08', 2, 1, 5);

.mode table
.header on 

/* WITH CLAUSE; อยากรู้ว่าโต๊ะไหนสั่ง 'carne asada fries' Staff คนไหนรับ order และ order ระหว่างวันที่ 2024/07/01 ถึง 2024/07/05 */

WITH
  order_staff AS (
    SELECT * FROM employee
    WHERE staff = 'waiter'
),

  order_carne AS (
    SELECT * FROM menu
    WHERE food_drink = 'carne asada fries'
),

  order_date AS (
    SELECT * FROM orders
    WHERE date BETWEEN '2024-07-01' AND '2024-07-05'
)

SELECT
 t2.order_id AS table_number,
 t1.firstname || ' ' || t1.lastname AS fullname_staff,
 t2.date 
FROM order_staff AS t1
JOIN order_date AS t2
ON t1.id = t2.staff
JOIN order_carne AS t3
ON t2.menu = t3.id
GROUP BY fullname_staff;

-- SUBQUERY; วันที่ผู้ชายมาร้านอาหารมากกว่าค่าเฉลี่ยของคนที่มา [AVG = 1.8]
SELECT date FROM orders
WHERE customer_female > (SELECT AVG(customer_female) FROM orders)

-- AGGREGATE FUNCTION; salary
SELECT 
  AVG(salary) AS avg_salary,
  SUM(salary) AS sum_salary,
  MIN(salary) AS min_salary,
  MAX(salary) AS max_salary,
  COUNT(salary) AS count_salary
FROM employee
