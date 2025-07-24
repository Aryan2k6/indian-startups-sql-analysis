-- VIEW FOR YEARLY_FUNDING
create or replace view yearly_funding as 
select year (date) as year, sum(Amount_In_Usd) as total_funding
from startup_funding
group by year;


-- VIEW FOR CITY WISE FUNDING
create or replace view city_wise_funding as 
select year(date), City_Location, count(*) as total_deals, sum(Amount_In_Usd) as total_funding 
from startup_funding
group by City_Location
order by total_funding DESC;



-- VIEW FOR INVESTOR ACTIVITY
create or replace view investor_activity as 
select Investors_Name, count(*) as number_of_investments,sum(Amount_In_Usd) as total_funded 
from startup_funding
group by Investors_Name
order by total_funded DESC;


-- VIEW FOR TOP STARTUPS
create or replace view Top_Startups as 
select startup_name , sum(Amount_in_USD) as total_funding, count(*) as number_of_rounds
from startup_funding
group by Startup_Name
order by total_funding DESC
Limit 10;





