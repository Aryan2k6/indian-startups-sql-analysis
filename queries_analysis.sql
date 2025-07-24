-- EXPLORING MY DATA   
Select * 
from startup_funding;

-- YEARWISE TOTAL FUNDING
select year(Date) as year, 
round(sum(Amount_in_Usd)) as total_amount 
from startup_funding 
group by year 
order by year;

-- TOP 10 FUNDED STARTUPS
select Startup_Name , 
sum(Amount_In_Usd) as total_funds 
from startup_funding
 group by startup_Name
 order by total_funds DESC 
 limit 10;

-- MOST COMMON CITIES FOR STARTEUPS
select City_Location, 
count(*)  as startup_count
 from startup_funding 
 group by City_Location
 order by startup_count DESC;

-- POPULAR INVESTMENT TYPES 
select Investment_Type, 
count(*) as investment_type_count
 from startup_funding
 group by Investment_Type
 order by investment_type_count DESC;

-- MONTH_WISE INVESTMENT TRENDS 
select date_format(Date, '%m') as month,
 round(sum(Amount_in_Usd)) as total_amount
 from startup_funding 
 group by month 
 order by month ;

-- MOST FREQUENT INVESTORS
select Investors_Name,
 count(*) as investment_name_count
 from startup_funding
 group by Investors_Name 
 order by investment_name_count DESC; 

-- INDUSTRY WISE AVERAGE DEAL SIZE 
select Industry_Vertical, round(avg(Amount_In_Usd)) as industry_count
 from startup_funding 
 group by Industry_Vertical 
 order by industry_count DESC;

-- TOP FUNDED CITIES BY YEAR 
select year(date) as year, City_Location , round(sum(Amount_In_Usd)) as total_funding 
from startup_funding
 group by year,City_Location 
 order by year, total_funding DESC;

-- STARTUP GETTING MULTIPLE INVESTMENTS
select Startup_Name ,
 count(*) as number_of_rounds , 
 sum(Amount_In_Usd) as total_funding 
 from startup_funding
 group by Startup_Name 
 having number_of_rounds >1 
 order by total_funding DESC;
 
 