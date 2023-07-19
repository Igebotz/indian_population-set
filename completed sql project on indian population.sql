create database population;
use population;


select * from data1;
select * from data2;

-- Q1 population of India
select sum(population) from data2;

-- Q2 avg growth 
select avg(Growth) from data1;

-- Q3 avg sex ratio
select avg(sex_ratio) from data1;

-- Q4 avg literacy rate
select avg(literacy) from data1;

-- Q5 top 3 state showing highest growth ratio
select state, max(Growth) from data1 group by state
order by  max(Growth) desc LIMIT 1,3;

-- Q6 bottom 3 state showing lowest sex ratio
select state, min(sex_ratio) from data1 group by state
order by min(sex_ratio) desc limit 1,3;

-- Q7 top and bottom 3 states in literacy state
select state, max(literacy) from data1 group by state
order by max(literacy) desc limit 1, 3;

select state, min(literacy) from data1 group by state
order by min(literacy) desc limit 1, 3;

-- Q8 states starting with letter a
select state from data1 where state LIKE 'a%';

-- Q9 total literacy
select sum(literacy) from data1;

-- Q10 output top 3 districts from each state with highest literacy rate

select state, District, literacy
from (select state, District, literacy,
    ROW_NUMBER() OVER (PARTITION BY state ORDER BY literacy DESC) AS row_num
  From data1
) AS subquery
where row_num <= 3;


