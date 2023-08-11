Select *
from [YoutubeReport].[dbo].[dataset] 

--Top 5 Youtube channels and their views
select top (10) Title, subscribers, [video views], country
from [YoutubeReport].[dbo].[dataset] 
where[video views] != 0

--Number of youtube channels per category
select category, COUNT(title) as no_of_channels
from [YoutubeReport].[dbo].[dataset]
where category != 'NULL'
group by category
order by no_of_channels DESC

--top youtube channels per category
with max_subscribes as 
(select MAX(subscribers) subscribers, category as category
from [YoutubeReport].[dbo].[dataset]
where category != 'NULL'
group by category)

select m.category, m.subscribers, d.title 
from [YoutubeReport].[dbo].[dataset] d 
join max_subscribes m on d.category = m.category AND d.subscribers = m.subscribers
order by subscribers DESC;


--top 10 channels with most monthly earnings
select top (10) title, highest_monthly_earnings, country
from [YoutubeReport].[dbo].[dataset]
where country != 'NULL'
order by highest_monthly_earnings DESC

-- top 10 channelss with most yearly earnings
select top (10) title, highest_yearly_earnings, country
from [YoutubeReport].[dbo].[dataset]
where country != 'NULL'
order by highest_yearly_earnings DESC

-- channels of Pakistan
select title, country
from [YoutubeReport].[dbo].[dataset]
where Country = 'Pakistan'

--top channels of Pakistan with highest yearly earnings
select title, highest_yearly_earnings 
from [YoutubeReport].[dbo].[dataset]
where Country = 'Pakistan'
order by highest_yearly_earnings DESC

--top channels of Pakistan with highest monthly earnings
select title, highest_monthly_earnings 
from [YoutubeReport].[dbo].[dataset]
where Country = 'Pakistan'
order by highest_monthly_earnings DESC

-- country population and unemployment rate
select country, MAX([Unemployment rate]) as unemployment_rate, MAX(Population) as Population
from [YoutubeReport].[dbo].[dataset]
where cast([Population] as varchar) != 'NULL'
group by country
order by unemployment_rate, Population DESC

--average monthly earning of youtubers per country
select country, MAX([Unemployment rate]) as unemployment_rate, MAX(Population) as Population, AVG(highest_monthly_earnings) as avg_earning
from [YoutubeReport].[dbo].[dataset]
where cast([Population] as varchar) != 'NULL'
group by country
order by avg_earning DESC

--number of youtube channels per country
select country, Count(Title) as no_of_channels
from [YoutubeReport].[dbo].[dataset]
where country != 'NULL'
group by country
order by no_of_channels DESC

-- number of youtube channels in pakistan and india
select country, Count(Title) as no_of_channels
from [YoutubeReport].[dbo].[dataset]
where Country = 'Pakistan' OR Country = 'India'
group by country

--countries with number of youtube channels
select country, Count(Title) as no_of_channels
from [YoutubeReport].[dbo].[dataset]
where Country != 'NULL'
group by country 
order by no_of_channels DESC

--most views per category
select category, SUM([video views]) as views_of_vids
from [YoutubeReport].[dbo].[dataset]
where category != 'NULL'
group by category
order by views_of_vids DESC

--most earnings per category
select category, SUM(highest_monthly_earnings) as monthly_earnings
from [YoutubeReport].[dbo].[dataset]
where category != 'NULL'
group by category
order by monthly_earnings DESC















select title, subscribers from [YoutubeReport].[dbo].[dataset] 
where subscribers > (select MAX(a.subscribers), a.category as subs, b.title
from [YoutubeReport].[dbo].[dataset] a
join [YoutubeReport].[dbo].[dataset] b
on a.category = b.category AND a.subscribers=b.subscribers
--where subscribers = (select subscribers from dataset)
where a.category != 'NULL'
group by a.category)
--group by a.category

select category, subscribers, title
from [YoutubeReport].[dbo].[dataset] 
--group by category
order by category



SELECT a.*
FROM [YoutubeReport].[dbo].[dataset] a 
WHERE a.rank = (SELECT b.rank
              FROM [YoutubeReport].[dbo].[dataset] b
              WHERE b.category = a.category
              --ORDER BY .views DESC
              --LIMIT 1
             )


select MAX(subscribers), category as subs
from [YoutubeReport].[dbo].[dataset] 
--where subscribers = (select subscribers from dataset)
where category != 'NULL'
group by category 







