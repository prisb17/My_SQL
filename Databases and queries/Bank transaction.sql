# Example of database Transaction

create database bank;
create TABLE accounts
(account_number INT,
account_holder_name varchar(13),
account_holder_surname varchar(13),
balance float,
overdraft_allowed BOOLEAN
);
insert into accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);

-- Our SQL transaction needs to do the following:
-- check that the balance of the first account is greater than £50.
-- Deduct £50 from the first account.
-- Add £50 to the second account.

select * from accounts;
start transaction;
select @moneyAvailable:=if (balance>0, balance, 0) as MONEY from accounts
where account_number=111112;

set @transferAmount=50;
update accounts set balance=balance-50 where account_number=111112;

set @transferAmount=50;
update accounts set balance=balance+50 where account_number=111113;

select * from accounts;

INSERT INTO conversation_log
(message,author) 
VALUES('I am tweeting', 'student1');

INSERT INTO conversation_log
(message,author) 
VALUES('I want to insert a new log message', 'student2');







