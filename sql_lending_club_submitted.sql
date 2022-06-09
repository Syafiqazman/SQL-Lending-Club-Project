--creating table
create table lendingclub ( 
id integer primary key,
member_id integer, 
loan_amnt real,
funded_amnt real,	
term text,	
int_rate real,
installment	real,
grade text,	
sub_grade text,	
emp_length	text,
home_ownership	text,
annual_inc	real,
verification_status text,	
issue_d text,	
loan_status	text,
description text,	
purpose text, 
addr_state text,
dti real,	
earliest_cr_line text, 	
out_prncp	real,
total_pymnt	real,
last_pymnt_d text,
last_pymnt_amnt	real,
application_type text,
recoveries real
);

--section 1, part 2, first 100 rows for all columns
select * from lendingclub 
limit 100

--section 2, part 1, funded amount equal 10,000
select count (distinct member_id) as number_of_customers
from lendingclub
where funded_amnt = 10000

--funded amount less than 10,000
select count (distinct member_id) as number_of_customers
from lendingclub
where funded_amnt < 10000

--funded amount greater than 10,000
select count (distinct member_id) as number_of_customers
from lendingclub
where funded_amnt > 10000

--section 2, part 2, how many terms for 36 and 60 months
select count (distinct member_id) as number_of_customers, term as term_duration
from lendingclub
group by term

--section 2, part 3, average/highest/lowest for interest rate
select avg (int_rate) as average_interest_rate,
max(int_rate) as highest_interest_rate,
min(int_rate) as lowest_interest_rate
from lendingclub

--section 2, part 4, number of unique loan statuses
select distinct loan_status as unique_loan_status
from lendingclub 
order by loan_status asc;

--count of unique loan status
select count (distinct loan_status) as unique_loan_status 
from lendingclub

--For each of the unique statuses found above, create an SQL statement that displays the first 100 rows
--for charged off
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Charged Off'
limit 100

--for current
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Current'
limit 100

--for default 
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Default'
limit 100

--for Does not meet the credit policy. Status:Charged Off
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Does not meet the credit policy. Status:Charged Off'
limit 100

--for Does not meet the credit policy. Status:Fully Paid
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Does not meet the credit policy. Status:Fully Paid'
limit 100

--for fully paid
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Fully Paid'
limit 100

--for in grace period
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'In Grace Period'
limit 100

--for issued
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Issued'
limit 100

--for late (16-30 days)
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Late (16-30 days)'
limit 100

--for late (31-120 days)
select distinct id as number_of_customers, loan_status 
from lendingclub 
where loan_status = 'Late (31-120 days)'
limit 100

--section 2, part 5, how many loan grades
select count (distinct grade) as loan_grade
from lendingclub

--how many loan subgrades
select count (distinct sub_grade) as loan_subgrade
from lendingclub

--section 2, part 6, how many customers defaulted on their loan obligations
select count (distinct member_id) as number_of_customers
from lendingclub
where loan_status = 'Default' 
or loan_status ='Late (31-120 days)' 
or loan_status ='Late (16-30 days)' 
or loan_status ='In Grace Period'
or loan_status ='Charged Off'
or loan_status = 'Does not meet the credit policy. Status: Charged Off'

--section 3, part 1, select all rows and columns to export
select * from lendingclub 






