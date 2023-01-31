--EDA with sql  

with hotels as (
select * from dbo.['2018$']
union 
select * from dbo.['2019$']
union
select * from dbo.['2020$'])
--combining three tables into one

select 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr  ), 2) as revenue 
from hotels
group by arrival_date_year, hotel
--calculating revenue and then grouping it by arrival year and type of hotel

select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal=hotels.meal
-- joining hotels and market_segment$ tables on market_segment; then joining meal_cost$ to them on meal





