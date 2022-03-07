-- Create relational DB of your choice with minimum 5 tables
-- (Because of the quantity, the information was added using csvs)

create database Blink_Delivery ;
use Blink_Delivery;

create table sales(
Invoice_No varchar(10) not null,
StockCode varchar(10) not null,
Quantity int);
select * from sales;

create table invoice(
Inv_id varchar(10) not null,
Inv_date datetime,
Cust_id varchar(10));
select * from invoice;

create table customer(
Cust_id varchar(10) not null,
Cust_name varchar(30),
age int,
gender varchar(20),
email  varchar(30),
Country varchar(20));
select * from customer;

create table product(
StockCode varchar(10) not null,
Description varchar(50),
Unit_price decimal(19,2),
Sup_id varchar(10));
select * from product;

create table supplier(
Sup_id varchar(10) not null,
Supplier varchar(30),
Country_sup varchar(30));
select * from supplier;

 



