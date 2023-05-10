DROP database if exists `Food_delivery`;
create database `Food_delivery`;
use `Food_delivery`;

create table `Restraunt`( `restraunt_id` int(11) not null auto_increment,
`restraunt_name` varchar(50) not null ,
`restraunt_address` varchar(50) not null,
`restraunt_city` varchar(50) not null,

primary key(`restraunt_id`)



)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `restraunt` VALUES(1,'Ramdev','kala talao','Kalyan');
INSERT INTO `restraunt` VALUES(2,'gurudev','shivaji chowk','kalyan');
INSERT INTO `restraunt` VALUES(3,'Sai Dhaba','Roshan','Kalyan');
INSERT INTO `restraunt` VALUES(4,'Shudha Shanti Missal','Shivaji chowk','Kalyan');


create table `Customer`( `Customer_id` int(11) not null auto_increment,
`Customer_name` varchar(50) not null ,
`Email` varchar(50) not null,
`Address` varchar(50) not null,
`Phone_number` int(11) ,
primary key(`Customer_id`)



)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customer` VALUES(1,'Rohan','Rohan@abc.com','Kalyan','123456789');
INSERT INTO `customer` VALUES(2,'Rohit','Rohit@abc.com','kolkata','987654321');
INSERT INTO `customer` VALUES(3,'Devansh','Devansh@abc.com','kolkata','122345678');

create table `menu`(
`menu_id` int(11) NOT NULL AUTO_INCREMENT,
`restraunt_id` int(11) NOT NULL,
`name` varchar(50) NOT NULL,
`price` int(11) NOT NULL,
Primary Key(`menu_id`),
 CONSTRAINT FK_MENUORDER FOREIGN KEY (`restraunt_id`) REFERENCES `restraunt`(`restraunt_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `menu` VALUES(1,'1','dosa','100');
INSERT INTO `menu` VALUES(2,'2','vada pav','20');
INSERT INTO `menu` VALUES(3,'3','pav bhaji','100');


create table `order`(
`order_id` int(11) NOT NULL AUTO_INCREMENT,
`restraunt_id` int(11) NOT NULL,
`customer_id` int(50) NOT NULL,
`menu_id` int(11) NOT NULL,
Primary Key(`order_id`),
 CONSTRAINT FK_resORDER FOREIGN KEY (`restraunt_id`) REFERENCES `restraunt`(`restraunt_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_cusUORDER FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_menORDER FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order` VALUES(1,1,1,2);
INSERT INTO `order` VALUES(2,2,2,1);
INSERT INTO `order` VALUES(3,3,3,3);


--1
select * 
from restraunt
where restraunt_address='shivaji chowk';
--2
select *
from menu m
join restraunt r
on m.restraunt_id=r.restraunt_id
where m.restraunt_id=1;
--3
INSERT INTO `order` VALUES(4,1,2,1);
INSERT INTO `order` VALUES(5,2,1,3);

--4
select c.customer_id,c.customer_name,c.email,c.phone_number,c.address,m.restraunt_id,m.name,m.price
from customer c
join `order` o
on o.customer_id=c.customer_id
join menu m
on m.menu_id=o.menu_id
where c.customer_id=3;
