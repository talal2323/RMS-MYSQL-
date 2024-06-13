create database Restaurant_Management_System;

use Restaurant_Management_System;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE MenuItems (
    item_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

ALTER TABLE Orders
ADD tax VARCHAR(50);



CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);


CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    quantity INT,
    reorder_point INT
);


CREATE TABLE Supplies (
    supply_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    quantity INT,
    reorder_point INT
);


CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    reservation_time DATETIME,
    table_number INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Bills (
    bill_id INT PRIMARY KEY,
    order_id INT,
    total_amount DECIMAL(10, 2),
    payment_status ENUM('Paid', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id)
);


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100),
    schedule VARCHAR(255),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    username VARCHAR(50),
    password VARCHAR(50)
);


INSERT INTO Customers (customer_id, name, phone_number, email) VALUES
(1, 'Ayan', '0334-1234567', 'ayanshapatar@gmail.com'),
(2, 'Dujana', '0333-1234567', 'dj@gmail.com'),
(3, 'Taha', '0332-1234567', 'taha@gmail.com'),
(4, 'Murtaza', '0331-1234567', 'murti@gmail.com'),
(5, 'Musab', '0330-1234567', 'musi@gmail.com'),
(6, 'shavez', '0329-1234567', 'shah@gmail.com'),
(7, 'Anas', '0328-1234567', 'pakao@gmail.com'),
(8, 'Maria', '0327-1234567', 'maria@gmail.com'),
(9, 'Shanti', '0326-1234567', 'bhai@gmail.com'),
(10, 'Dujana', '0333-1234567', 'dj@gmail.com');

select * from Customers;


INSERT INTO MenuItems (item_id, name, description, price, category) VALUES
(1, 'Cheeseburger', 'Classic beef burger with cheddar cheese', 9.99, 'Burgers'),
(2, 'Margherita Pizza', 'Classic pizza topped with tomato sauce and mozzarella cheese', 12.99, 'Pizzas'),
(3, 'Caprese Salad', 'Fresh tomatoes, mozzarella cheese, basil leaves, olive oil, and balsamic glaze', 8.75, 'Appetizers'),
(4, 'Caesar Salad', 'Romaine lettuce with Caesar dressing, croutons, and Parmesan cheese', 6.50, 'Appetizers'),
(5, 'Chocolate Lava Cake', 'Warm chocolate cake with a molten center, served with vanilla ice cream', 7.25, 'Desserts'),
(6, 'Spaghetti Carbonara', 'Pasta with creamy egg sauce, pancetta, and Parmesan cheese', 12.00, 'Main Course'),
(7, 'Garlic Bread', 'Toasted bread with garlic butter and parsley', 3.99, 'Appetizers'),
(8, 'Grilled Salmon', 'Salmon fillet grilled to perfection, served with a side of vegetables', 15.75, 'Main Course'),
(9, 'Mango Smoothie', 'Fresh mango blended with yogurt and honey', 4.50, 'Beverages'),
(10, 'Chicken Tenders', 'Crispy chicken tenders served with honey mustard sauce', 9.25, 'Main Course');

select * from MenuItems;


INSERT INTO Orders (order_id, customer_id, total_amount,tax) VALUES
(1, 1, 53.39,13),
(2, 2, 36.73,13),
(3, 3, 22.58,13),
(4, 4, 14.68,13),
(5, 5, 27.12,13),
(6, 6, 41.81,13),
(7, 7, 22.54,13),
(8, 8, 10.17,13),
(9, 9, 81.36,13),
(10, 10, 24.58,13);

select * from Orders;


INSERT INTO OrderItems (order_item_id, order_id, item_id, quantity, subtotal) VALUES
(1, 1, 8, 3, 47.25),
(2, 2, 4, 5, 32.50),
(3, 3, 1, 2, 19.98),
(4, 4, 2, 1, 12.99),
(5, 5, 6, 2, 24.00),
(6, 6, 10, 4, 37.00),
(7, 7, 7, 5, 19.95),
(8, 8, 9, 2, 9.00),
(9, 9, 6, 6, 72.00),
(10, 10, 5, 3, 21.75);

select * from OrderItems;


INSERT INTO Ingredients (ingredient_id, name, quantity, reorder_point) VALUES
(1, 'Tomato', 100, 40),
(2, 'Lettuce', 80, 30),
(3, 'Onion', 50, 20),
(4, 'Bell Pepper', 40, 15),
(5, 'Mushroom', 30, 10),
(6, 'Garlic', 60, 25),
(7, 'Basil', 20, 5),
(8, 'Oregano', 25, 10),
(9, 'Lemon', 40, 15),
(10, 'Cilantro', 30, 10);

select * from Ingredients;


INSERT INTO Supplies (supply_id, name, quantity, reorder_point) VALUES
(1, 'Napkins', 200, 50),
(2, 'Disposable Cups', 300, 100),
(3, 'Plates', 150, 50),
(4, 'Straws', 500, 200),
(5, 'To-Go Containers', 400, 150),
(6, 'Cleaning Solution', 5, 2),
(7, 'Trash Bags', 100, 30),
(8, 'Dish Soap', 10, 5),
(9, 'Aluminum Foil', 50, 20),
(10, 'Paper Towels', 100, 30);

select * from Supplies;


INSERT INTO Reservations (reservation_id, customer_id, reservation_time, table_number) VALUES
(1, 1, '2024-05-20 18:00:00', 5),
(2, 2, '2024-05-22 19:30:00', 8),
(3, 3, '2024-05-25 20:00:00', 3),
(4, 4, '2024-05-27 17:45:00', 6),
(5, 5, '2024-05-30 18:30:00', 2),
(6, 6, '2024-06-02 19:15:00', 7),
(7, 7, '2024-06-05 18:45:00', 4),
(8, 8, '2024-06-07 19:00:00', 1),
(9, 9, '2024-06-10 20:30:00', 9),
(10, 10, '2024-06-12 18:15:00', 10);

select * from Reservations;


INSERT INTO Bills (bill_id, order_id, total_amount, payment_status) VALUES
(1, 1, 53.39, 'Paid'),
(2, 2, 36.73, 'Pending'),
(3, 3, 22.58, 'Pending'),
(4, 4, 14.68, 'Paid'),
(5, 5, 27.12, 'Paid'),
(6, 6, 41.81, 'Pending'),
(7, 7, 22.54, 'Paid'),
(8, 8, 10.17, 'Pending'),
(9, 9, 81.36, 'pending'),
(10,10, 24.58, 'Pending');

select * from Bills;


INSERT INTO Payments (payment_id, bill_id, amount, payment_method) VALUES
(1, 1, 53.39, 'Credit Card'),
(2, 2, 36.73, 'Cash'),
(3, 3, 22.58, 'Cash'),
(4, 4, 14.68, 'Credit Card'),
(5, 5, 27.12, 'Cash'),
(6, 6, 41.81, 'Cash'),
(7, 7, 22.54, 'Credit Card'),
(8, 8, 10.17, 'Credit Card'),
(9, 9, 81.36, 'Credit Card'),
(10, 10, 24.58, 'Cash');

select * from Payments;


INSERT INTO Employees (employee_id, name, role, schedule, email, phone_number, username, password) VALUES
(1, 'Talal Yousuf', 'Chef', 'Tuesday-Saturday 16:00-23:00', 'talal@example.com', '03241234567', 'talalchef', 'password456'),
(2, 'Muskaan Haleem', 'Chef', 'Tuesday-Saturday 16:00-23:00', 'mske@example.com', '0123456789', 'mskchef', 'password789'),
(3, 'Qasim Ali', 'Waiter', 'Wednesday-Friday 10:00-18:00', 'qasim@example.com', '5551234567', 'qasimwaiter', 'password123'),
(4, 'David Brown', 'Chef', 'Monday-Friday 08:00-16:00', 'david@example.com', '5552345678', 'davidchef', 'password234'),
(5, 'Jennifer Wilson', 'Bartender', 'Thursday-Sunday 17:00-01:00', 'jennifer@example.com', '5553456789', 'jenniferbartender', 'password345'),
(6, 'Michael Smith', 'Manager', 'Monday-Saturday 09:00-17:00', 'manager@example.com', '5554567890', 'manager', 'password456'),
(7, 'Jessica Lee', 'Hostess', 'Friday-Sunday 14:00-22:00', 'jessica@example.com', '5555678901', 'jessicahostess', 'password567'),
(8, 'Daniel Taylor', 'Server', 'Tuesday-Saturday 12:00-20:00', 'daniel@example.com', '5556789012', 'danielserver', 'password678'),
(9, 'Emma Anderson', 'Chef', 'Wednesday-Monday 11:00-19:00', 'emma@example.com', '5557890123', 'emmachef', 'password789'),
(10, 'James Garcia', 'Server', 'Thursday-Sunday 16:00-00:00', 'james@example.com', '5558901234', 'jamesserver', 'password890');

select * from Employees;