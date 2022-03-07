# Examples of queries for a Sales database 
use shop;

select * 
from sales1 
where store='London' and month <>'Dec' and salesperson in ('Bill','Frank') and salesamount>50.00;

select week, count(*) from sales1 group by week;
select week, count(*) from sales1 group by week order by week desc;
select week, count(*) from sales1 group by week order by week;
select week, count(*) from sales1 group by week having count(*)>=2 order by week;

update sales1
set
SALESPERSON='Annette'
where SALESPERSON='Inga';
select * from sales1;
select *
From sales1 
group by day
order by day;

select SALESPERSON, 
count(*) from sales1 
where SALESPERSON='Annette';

Select count(salesamount)
FROM sales1
WHERE salesperson = 'Annette';

select SALESPERSON, day, sum(SALESAMOUNT)
from sales1
group by salesperson,day
order by salesperson,day;

select SALESPERSON, sum(SALESAMOUNT), count(SALESPERSON), min(SALESAMOUNT), avg(SALESAMOUNT), max(SALESAMOUNT)
from sales1
group by salesperson;

select Store, sum(SALESAMOUNT)
from sales1
group by Store;

select SALESPERSON, count(SALESPERSON)
from sales1
group by salesperson
having count(SALESPERSON)<3;

select month, sum(SALESAMOUNT)
from sales1
group by month
having sum(SALESAMOUNT)<100;