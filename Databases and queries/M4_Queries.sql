# Example of queries for a supplier database

use parts;
-- Find the name and status of each supplier who supplies project J2
select sname, status
from supplier
where s_id in(select s_id from supply where j_id='J2');


-- Find the name and city of each project supplied by a London-based supplier

## Option 1 taking data from supplier table (no scalable)
select jname, city
from project
where J_ID in(select J_ID from supply where S_ID='S1'or S_ID='S4' );
## Option 2 nested queries with where
select jname, city
from project
where J_ID in
(select J_ID 
from supply
WHERE S_ID in
(SELECT S_ID
FROM supplier
where CITY='LONDON'));

## Option 3 with inner join
select pj.jname, pj.city
from supply as sy
join supplier as sr
on sy.s_id=sr.s_id
join project as pj
on sy.j_id=pj.j_id
where sr.city='London';

## Find the name and city of each project not supplied by a London-based supplier
## Option 1
select jname, city
from project
where J_ID in
(select J_ID 
from supply
WHERE S_ID not in
(SELECT S_ID
FROM supplier
where CITY='LONDON'));

## Option 2
select jname, city
from project
where J_ID in
(select J_ID 
from supply
WHERE S_ID in
(SELECT S_ID
FROM supplier
where CITY<>'LONDON'));

## Find the supplier name, part name and project name for each case where a supplier
## supplies a project with a part, but also the supplier city, project city and part city
## are the same.
 
SELECT sr.sname, pt.pname, pj.jname
from supply as sy
join supplier as sr
on sy.s_id=sr.s_id
join part as pt
on sy.p_id=pt.p_id
join project as pj
on sy.j_id=pj.j_id
where sr.city=pj.city and pj.city=pt.city;

