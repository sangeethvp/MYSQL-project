CREATE TABLE customers(
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(100),
  customer_email VARCHAR(100),
  customer_address VARCHAR(200)
  ); --creating the tables named customers with name , email, address and id as primarykey and ans autoincreament
  
CREATE TABLE orders(
   order_id INT AUTO_INCREMENT PRIMARY KEY,
   customer_id INT,
   order_date DATE,
   total_amount DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
  ); --creating the tables named orders with date , amount and id as foreignkey reference to customers
  
  CREATE TABLE products(
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100),
  product_price DECIMAL(10,2),
  product_description text
  ); ----creating the tables named products with name ,price,description and id as foreignkey reference to customers


--insereting values into the tables
INSERT INTO customers(customer_name,customer_email,customer_address)
VALUES
("smith","smith@gmail.com","123 street"),
("kane","kane@gmail.com","123 main street"),
("clarke","clarke@gmail.com","123 street near the park"),
("david","david@gmail.com","1/2 church street");

INSERT INTO orders(customer_id,order_date,total_amount)
VALUES
(1,"2024-10-09",150.50),
(2,"2024-09-29",155.10),
(3,"2024-07-09",140.00),
(4,"2024-07-10",141.88);

INSERT INTO products(product_name,product_price,product_description)
VALUES
("product A",65.10,"gaming laptop"),
("product B",70.50,"smartTV"),
("product C",61.88,"smartwatch"),
("product D",60.00,"AnalogWatch");

 --queries
--1-> 
SELECT customers.*FROM customers JOIN orders --select all the values from customer and join customers id with customers_id in order
ON customers.id = orders.customer_id WHERE order_date >= CURDATE() - INTERVAL 30 DAY; --give the customers info who ordered within last 30 dates with reference to currentdate

--2->
SELECT customers.name, SUM(orders.total_amount)AS total FROM customers --gives customers name and the respective orders of each customers as total
JOIN orders ON customers.id = orders.customer_id GROUP BY customers.name; 

--3->
UPDATE products 
SET product_price=45.00 --setting the price to 45 only to product C from products
WHERE product_name="product C";
SELECT*FROM products;

--4->
ALTER TABLE products -- adding a new column to the table named discount
ADD COLUMN discount DECIMAL(10,2);
UPDATE products
set discount = 10.00
WHERE product_id=1;
SELECT*FROM products;

--5->
SELECT* --getting the list of the top 3 products with respect to thier price
FROM products
ORDER BY product_price DESC LIMIT 3;

--6->
SELECT customers.name FROM customers --getting the customer name from customers
JOIN orders ON customers.id = orders.customer_id --joining orders with customers on reference to customers.id and orders.customer_id to get the order details
WHERE products.product_name = "product A";

--7->
SELECT customers.name,orders.order_date FROM customers --getting customers name and their ordered date
JOIN orders ON customers.id = orders.customer_id; --joining two tables to get customer name from customers and date from orders with respect to the id

--8->
SELECT *FROM orders WHERE total_amount > 150.00; --getting the orders having total amount greater than 150

--9->
SELECT AVG(total_amount) FROM orders; --getting the average amount from orders
