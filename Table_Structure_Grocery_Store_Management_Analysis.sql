create database Grocery_stored;
use Grocery_stored;
-- 1. Supplier table
create table if not exists Suppliers(
Supplier_id tinyint auto_increment primary key ,
Supplier_name varchar(100),
Address text);

-- 2. Categories table
create table if not exists Categories(
Category_id tinyint auto_increment primary key,
Category_name varchar(100)
);

-- 3. Employees Table
create table if not exists Employees(
Employee_id tinyint auto_increment primary key,
Employee_name varchar(100),
hire_date varchar(100)
);
desc employees;
ALTER TABLE employees ADD COLUMN hire_date_temp DATE;
set sql_safe_updates = 0;
UPDATE employees 
SET hire_date_temp = STR_TO_DATE(hire_date, '%m/%d/%Y');
alter table employees drop column hire_date;
ALTER TABLE employees CHANGE hire_date_temp hire_date DATE;
select * from employees;

-- 4. Customers Table
create table if not exists Customers(
Customer_id smallint auto_increment primary key,
Customer_name varchar(100),
Address text
);

-- 5. Products Table
create table if not exists Products(
Product_id smallint auto_increment primary key,
Product_name varchar(100),
Supplier_id tinyint,
category_id tinyint,
Price decimal(10,2),
FOREIGN KEY (Supplier_id) REFERENCES suppliers(supplier_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Category_id) references Categories(Category_id) on update cascade on delete cascade
);


-- 6. Orders Table
create table if not exists Orders(
Order_id smallint auto_increment primary key,
Customer_id smallint,
Employee_id tinyint,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
foreign key (Employee_id) references Employees(Employee_id)ON UPDATE CASCADE ON DELETE CASCADE,
Order_date varchar(100));
desc orders;
ALTER TABLE orders ADD COLUMN order_date_temp DATE;
set sql_safe_updates = 0;
UPDATE orders
SET order_date_temp = STR_TO_DATE(order_date, '%m/%d/%Y');
alter table orders drop column order_date;
ALTER TABLE orders CHANGE order_date_temp order_date DATE;
select * from orders;




-- 7. Order_detailas
CREATE TABLE IF NOT EXISTS order_details (
    ord_detID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    order_id SMALLINT,
    product_id smallint,
    quantity TINYINT,
    each_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

select * from Suppliers;
select * from Categories;
select * from Employees;
select * from Customers;
select * from products;
select * from Orders;
select * from order_details;
