CREATE DATABASE product_Management_System;
USE Product_Management_System;
CREATE TABLE `Product`(
    `product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product name` VARCHAR(255) NOT NULL,
    `product price` INT NOT NULL,
    `product quantity` INT NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    `product size` VARCHAR(255) NOT NULL
);
CREATE TABLE `category`(
    `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category name` VARCHAR(255) NOT NULL,
    `category description` VARCHAR(255) NOT NULL
);
CREATE TABLE `roles`(
    `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `roles name` VARCHAR(255) NOT NULL,
    `roles permission` VARCHAR(255) NOT NULL
);
CREATE TABLE `Orders`(
    `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL,
    `order quantity` INT NOT NULL,
    `product_id` INT NOT NULL
);
CREATE TABLE `Order details`(
    `order details_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT UNSIGNED NOT NULL,
    `quantity` INT NOT NULL,
    `product_id` INT NOT NULL
);
CREATE TABLE `Users`(
    `Users_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user Name` VARCHAR(255) NOT NULL,
    `User Email` VARCHAR(255) NOT NULL,
    `User password` VARCHAR(255) NOT NULL,
    `Role_id` BIGINT NOT NULL
);
ALTER TABLE
    `Users` ADD UNIQUE `users_user email_unique`(`User Email`);
ALTER TABLE
    `Users` ADD UNIQUE `users_user password_unique`(`User password`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`Users_id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_users_id_foreign` FOREIGN KEY(`Users_id`) REFERENCES `roles`(`role_id`);
ALTER TABLE
    `Order details` ADD CONSTRAINT `order details_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Orders`(`order_id`);
ALTER TABLE
    `Order details` ADD CONSTRAINT `order details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Product`(`product_id`);

--insert into the database
INSERT INTO roles
values(1, "admin", "create, read, update, delete");

INSERT INTO USERS
values(1, "Emmauel Paul", "emmanuelpaul@gmail.com", "Emmauelpaul123", 1);

INSERT INTO CATEGORY
values(2 ,"Roundnecks", "clothes for men");

INSERT INTO PRODUCT
values(1, "shirt", 50 ,"500", 2 ,"large");

INSERT INTO ORDERS
values(1 ,1, 30, 1 );

INSERT INTO `ORDER DETAILS`
values(1, 1, 50 ,1);

--query from the database

select * from product;  
SELECT `user Name`, `User Email`, Role_id from Users 
SELECT *from roles

--update from the database
update users
set `user Name` = "Peter Eliot"
where Users_id = 1;

update roles
set `roles name` = "manager"
where role_id = 2;

--delete from the database 
delete from category
where category_id = 1

--query joined tables from the database
select `user Name`, `User Email`, `roles name`
 from users 
 inner join roles
  on users.Role_id = roles.role_id
  -- inner join orders

select `user Name`, `User Email`, `order quantity`, `product name`, `product price`
from users
inner join orders
on users.Users_id = orders.user_id
inner join `order details`
on orders.order_id = `order details`.order_id
inner join product
on `order details`.product_id = product.product_id
