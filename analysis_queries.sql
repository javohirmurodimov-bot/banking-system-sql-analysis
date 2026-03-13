select * from customers
select * from accounts
select * from transactions
select * from branches
select * from loans

--Top 3 Customers with the Highest Total Balance Across All Accounts 
select top 3
c.customerid,
c.fullname,
sum(a.balance) as total_balance
from customers c
join accounts a on c.customerid = a.customerid
group by c.customerid, c.fullname
order by sum(a.balance) desc;

--Customers Who Have More Than One Active Loan
select 
c.customerid,
c.fullname,
count(l.loanid) as loan_count
from customers c
join loans l on c.customerid = l.customerid
where l.status = 'active'
group by c.customerid, c.fullname
having count(l.loanid) > 1;

--Transactions That Were Flagged as Fraudulent    
select 
t.transactionid,
c.fullname,
t.amount,
t.date,
t.country
from transactions t
join customers c on c.customerid = t.customerid
where t.status = 'fraud';

--Total Loan Amount Issued Per Branch
select 
b.branchname,
sum(l.amount) as total_loan_amount
from branches b
join accounts a on b.branchid = a.branchid
join loans l on l.customerid = a.customerid
group by b.branchname
order by total_loan_amount desc;

--Customers who made multiple large transactions (above $10,000) within a short time frame (less than 1 hour apart)
select distinct
c.customerid,
c.fullname
from transactions t1
join transactions t2 
on t1.customerid = t2.customerid
and t1.transactionid <> t2.transactionid
join customers c on c.customerid = t1.customerid
where t1.amount > 10000
and t2.amount > 10000
and abs(datediff(minute, t1.date, t2.date)) < 60;

--Customers who have made transactions from different countries within 10 minutes, a common red flag for fraud.
select distinct
c.customerid,
c.fullname
from transactions t1
join transactions t2
on t1.customerid = t2.customerid
and t1.transactionid <> t2.transactionid
join customers c on c.customerid = t1.customerid
where t1.country <> t2.country
and abs(datediff(minute, t1.date, t2.date)) <= 10;
