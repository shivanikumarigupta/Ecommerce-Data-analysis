create database Ecommerce;
use Ecommerce;
CREATE TABLE `customer` (
`customer_id` varchar(10) NOT NULL,
`name` varchar(100) NOT NULL,
`city` varchar(65) NOT NULL,
`email` varchar(45) NOT NULL,
`phone_no` varchar(15) NOT NULL,
`address` varchar(100) NOT NULL,
`pin_code` int NOT NULL,
PRIMARY KEY (`customer_id`)
) ;

insert into customer(customer_id,name,city,email,phone_no,address,pin_code)
 values
 ("c1001","steve","Tokyo","steve@gmail.com",4567897652,"f.g.road",99),
("c1002","john","Sydney","john@gmail.com",9635847562,"k.c.road",75001),
("c1003","peter","kanagava","peterparker@gmail.com",7830847564,"2f ikenobecho",171),
("c1004","jackson","Tokyo","jackson@gmail.com",7839847562,"24-2,sendagaya",8429),
("c1005","jack","lake buana","jack@gmail.com",8876345621,"buena drive",32830);
select * from customer;


CREATE TABLE `product` (
`product_id` varchar(10) NOT NULL,
`product_name` varchar(100) NOT NULL,
`category` varchar(65) NOT NULL,
`sub_category` varchar(45) NOT NULL,
`original_price` double NOT NULL,
`selling_price` double NOT NULL,
`stock` int NOT NULL,
PRIMARY KEY (`product_id`)
);

insert into product(product_id,product_name,category,sub_category,original_price,selling_price,stock)
 values
 ("p102","Chair","furniture","Chairs",20000.0,15000.00,10),
("p103","Laptop","Electronics","computer",60000.0,55000.00,50),
("p104","Smartphone","Electronics","Phone",45000.0,40000.00,20),
("p105","Blender","Appliance","Electronics",500.0,450,10),
("p106","Laptop Hp","Electronics","Computer",67200.0,55000.99,50);
select * from product;

CREATE TABLE `order_details` (
`order_id` int NOT NULL AUTO_INCREMENT,
`customer_id` varchar(10) NOT NULL,
`product_id` varchar(10) NOT NULL,
`quantity` double NOT NULL,
`total_price` double NOT NULL,
`payment_mode` varchar(60) NOT NULL,
`order_date` datetime DEFAULT NULL,
`order_status` varchar(20) NOT NULL,
PRIMARY KEY (`order_id`),
KEY `customer_id` (`customer_id`),
KEY `product_id` (`product_id`),
CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`customer_id`)
REFERENCES `customer` (`customer_id`),
CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`)
REFERENCES `product` (`product_id`)
);
INSERT INTO order_details 
(order_id, customer_id, product_id, quantity, total_price, payment_mode, order_date, order_status) 
VALUES
("3", "c1004", "P102", 1.0, 1000.0, "CDD", '2023-11-30', "Pending"),
("4", "c1005", "P103", 1.0, 20000.0, "CDD", '2023-11-30', "Pending"),
("5", "c1005", "P104", 1.0, 20000.0, "CDD", '2023-12-08', "Delivered"),
("7", "c1006", "P105", 1.0, 55000.0, "CDD", '2023-12-15', "Delivered"),
("8", "c1006", "P106", 1.0, 15000.0, "CDD", '2023-12-01', "Delivered");

select * from customer;
select * from order_details;
select * from product;