## CORE REQUIREMENTS

use Blink_Delivery;
select * from sales;
select * from product;
select * from invoice;
select * from customer;
select * from supplier;

-- 1. Using any type of the joins create a view that combines multiple tables in a logical way
-- The view generated is a simulation of the information available for Germany

create or replace view Germany_DB
as
select Sal.Invoice_No, Inv.Inv_date, cust.country, Sal.StockCode, Prod.Description, Sup.Sup_id, Sup.Country_sup, Sal.Quantity
from sales as sal
join invoice as inv
on Sal.Invoice_No=Inv.Inv_id
join product as Prod
on Sal.StockCode=Prod.StockCode
join customer as cust
on Inv.Cust_id=cust.Cust_id
join supplier as Sup
on Prod.Sup_id=Sup.Sup_id
where cust.country like'Germany'
order by Invoice_No asc;
select * from Germany_DB;

-- 2. In your database, create a stored function that can be applied to a query in your DB

     -- I am generating a view that contains the products and its quantity group by customer age
     -- This could allow me to target the products according to the customer age group
     
create or replace view Product_per_group_age
as
select Sal.StockCode, Prod.Description, Sal.Quantity, cust.age
from sales as sal
join product as Prod
on Sal.StockCode=Prod.StockCode
join invoice as inv
on Sal.Invoice_No=Inv.Inv_id
join customer as cust
on Inv.Cust_id=cust.Cust_id
group by Sal.StockCode
order by Sal.StockCode asc;
select * from Product_per_group_age;
	
    -- Function
    
delimiter //
create function group_age(age int)
returns varchar(30)
DETERMINISTIC
BEGIN 
declare stockcode_status varchar(30);
if age <=30 then set stockcode_status='young consumer';
elseif (age >30 and age <=60) then set stockcode_status='middle age consumer';
elseif (age >60) then set stockcode_status='elderly consumer';
end if;
return(stockcode_status);
end//
delimiter ;
select StockCode, Description, Quantity, age, group_age(age) from Product_per_group_age;


-- 3. Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
		-- Find the stockcode and quantity of each sale where the customer is a Female 
             
select stockcode, quantity from sales
where Invoice_No in (select Inv_id from invoice where Cust_id in
(select Cust_id from customer where gender='female'));

## ADVANCED OPTIONS

-- 1. In your database, create a stored procedure and demonstrate how it runs

select* from sales;
delimiter //
create procedure insertsale(
in Invoice_No varchar(10),
in Stockcode varchar(10),
in Quantity int)
Begin
insert into sales(Invoice_No, Stockcode, Quantity)
values (Invoice_No, Stockcode, Quantity);
end//
delimiter ;
call insertsale(548497,'21917',10);
select* from sales where Invoice_No=548497;

-- 2 Create a view that uses at least 3-4 base tables; prepare and demonstrate 
-- a query that uses the view to produce a logically arranged result set for analysis.

create or replace view France_DB
as
select Sal.Invoice_No, Inv.Inv_date, cust.country, Sal.StockCode, Prod.Description, Sup.Sup_id, Sup.Country_sup, Sal.Quantity
from sales as sal
join invoice as inv
on Sal.Invoice_No=Inv.Inv_id
join product as Prod
on Sal.StockCode=Prod.StockCode
join customer as cust
on Inv.Cust_id=cust.Cust_id
join supplier as Sup
on Prod.Sup_id=Sup.Sup_id
where cust.country like'France'
order by Invoice_No asc;
select * from France_DB; 

select stockcode, description, quantity from France_DB 
where Country_sup='France' and quantity>10 and quantity<=20;
 
 -- 3. Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis
 --  Define the Invoice_No, Inv_date,Cust_id, Sup_id,Country_sup for all the invoice having more than 10 products sold
 
select Sal.Invoice_No, Inv.Inv_date, cust.Cust_id, Sup.Sup_id, Sup.Country_sup, Sal.Quantity
from sales as sal
join invoice as inv
on Sal.Invoice_No=Inv.Inv_id
join product as Prod
on Sal.StockCode=Prod.StockCode
join customer as cust
on Inv.Cust_id=cust.Cust_id
join supplier as Sup
on Prod.Sup_id=Sup.Sup_id
group by Sal.Invoice_No
having quantity >=10
order by Invoice_No asc;
 
-- 4. In your database, create a trigger and demonstrate how it runs

select* from customer
DELIMITER //
create trigger capitalise_country
BEFORE INSERT on customer
FOR EACH ROW
BEGIN
set new.country=UPPER(new.country);
END //
delimiter ;

insert into customer (Cust_id, Cust_name, age, gender, email, Country)
values(12346, 'John Smith', 40, 'Male','Jshmith@hotmail.com','belgium');

DROP TRIGGER capitalise_country;

select* from customer
where Cust_id=12346;


