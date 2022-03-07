#Example of queries joining tables to create reports

CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

select*from table1_fruit_basket;
select*from table2_fruit_basket;

-- inner joint
select t1.*,t2.*
from table1_fruit_basket t1 inner join table2_fruit_basket t2
on t1.id=t2.id;

-- inner joint option 2
select t1.*,t2.*
from table1_fruit_basket t1, table2_fruit_basket t2
where t1.id=t2.id;

select t1.*,t2.*
from table1_fruit_basket t1 left join table2_fruit_basket t2
on t1.id=t2.id;

select t1.*,t2.*
from table1_fruit_basket t1 right join table2_fruit_basket t2
on t1.id=t2.id;




CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(55),
    ManagerID INT
);

INSERT INTO Employee
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Marry',2),
(5, 'Joseph',2),
(7, 'Ben',2);

select* from employee;

select e1.name as Employee_NAME, e2.name as 'Managers name'
from employee e1 inner join employee e2 on e1.managerid=e2.employeeid;

select e1.name as Employee_NAME, IFNULL(e2.name, 'TOP MANAGER') as ManagersName
from employee e1 left join employee e2 on e1.managerid=e2.employeeid;

select t1.id t1_id, t1.fruit t1fruit
from table1_fruit_basket t1
union
select t2.id as T2ID, t2.fruit as t2Fruit
from table2_fruit_basket t2;

select t1.id t1_id, t1.fruit t1fruit
from table1_fruit_basket t1
union all