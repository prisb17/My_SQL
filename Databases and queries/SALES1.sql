#Example of database for Sales sector

create database shop;
use shop;
create table SALES1
(Store varchar(50) not null,
Week integer not null,
Day varchar(20) not null,
SALESPERSON varchar(50) not null,
SALESAMOUNT decimal(10,2) not null,
Month varchar(20) not null);

insert into SALES1
(Store, Week, Day, salesPerson, SalesAmount, Month)
values
('London', 2, 'Monday', 'Frank', 56.25, 'May'),
('London', 5, 'Tuesday', 'Frank', 74.32, 'Sep'),
('London', 5, 'Monday', 'Bill', 98.42, 'Sep'),
('London', '5', 'Saturday', 'Bill', 73.90, 'Dec'),
('London', 1, 'Tuesday', 'Josie', 44.27, 'Sep'),
('Dussledorf', 4, 'Monday', 'Manfred', 77.00, 'Jul'),
('Dussledorf', 3, 'Tuesday', 'Inga', 9.99, 'Jun'),
('Dussledorf', 4, 'Wednesday', 'Manfred', 86.81, 'Jul'),
('London', 6, 'Friday', 'Josie', 74.02, 'Oct'),
('Dussledorf', 1, 'Saturday', 'Manfred', 43.11, 'Apr');