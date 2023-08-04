Select * 
from dbo.['2015$']

Select * 
from dbo.['2016$']

Select * 
from dbo.['2017$']

Select * 
from dbo.['2018$']

Select * 
from dbo.['2019$']


--Select the data that we will be using in this project
--country, rank, score/happiness score, freedom, corruption, economy/gdp, generosity
Select Country, [Happiness Rank], [Happiness Score], Freedom, [Trust (Government Corruption)], [Economy (GDP per Capita)], Generosity
from dbo.['2015$']

Select Country, [Happiness Rank], [Happiness Score], Freedom, [Trust (Government Corruption)], [Economy (GDP per Capita)], Generosity
from dbo.['2016$']

Select Country, [Happiness#Rank], [Happiness#Score], Freedom, [Trust##Government#Corruption#], [Economy##GDP#per#Capita#], Generosity
from dbo.['2017$']

Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], [Perceptions of corruption], [GDP per Capita], Generosity
from dbo.['2018$']

Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], [Perceptions of corruption], [GDP per Capita], Generosity
from dbo.['2019$']


--Looking at Happiness score vs Freedom
Select a.Country, ROUND((a.Freedom/a.[Happiness Score])*100,2) as fifteen, ROUND((b.Freedom/b.[Happiness Score])*100,2) as sixteen, ROUND((c.Freedom/c.[Happiness#Score])*100,2) as seventeen, ROUND((d.[Freedom to make life choices]/d.Score)*100,2) as eighteen, ROUND((e.[Freedom to make life choices]/e.[Score])*100,2) as ninteen
from dbo.['2015$'] as a
join dbo.['2016$'] as b
on a.Country=b.Country
join dbo.['2017$'] as c
on a.Country=c.Country
join dbo.['2018$'] as d
on a.Country=d.[Country or region]
join dbo.['2019$'] as e
on a.Country=e.[Country or region]


--Looking at Score vs Trust
Select a.Country, ROUND((a.[Trust (Government Corruption)]/a.[Happiness Score])*100,2) as ScoreVsCorruption15, ROUND((b.[Trust (Government Corruption)]/b.[Happiness Score])*100,2) as ScoreVsCorruption16, ROUND((c.[Trust##Government#Corruption#]/c.[Happiness#Score])*100,2) as ScoreVsCorruption17, ROUND((d.[Perceptions of corruption]/d.[Score])*100,2) as ScoreVsCorruption18, ROUND((e.[Perceptions of corruption]/e.Score)*100,2) as ScoreVsCorruption19
from dbo.['2015$'] as a
join dbo.['2016$'] as b
on a.Country=b.Country
join dbo.['2017$'] as c
on a.Country=c.Country
join dbo.['2018$'] as d
on a.Country=d.[Country or region]
join dbo.['2019$'] as e
on a.Country=e.[Country or region]

--Looking at score vs GDP
Select a.Country, ROUND((a.[Economy (GDP per Capita)]/a.[Happiness Score])*100,2) as ScoreVsGDP15, ROUND((b.[Economy (GDP per Capita)]/b.[Happiness Score])*100,2) as ScoreVsGDP16, ROUND((c.[Economy##GDP#per#Capita#]/c.[Happiness#Score])*100,2) as ScoreVsGDP17, ROUND((d.[GDP per capita]/d.[Score])*100,2) as ScoreVsGDP18, ROUND((e.[GDP per capita]/e.[Score])*100,2) as ScoreVsGDP19
from dbo.['2015$'] as a
join dbo.['2016$'] as b
on a.Country=b.Country
join dbo.['2017$'] as c
on a.Country=c.Country
join dbo.['2018$'] as d
on a.Country=d.[Country or region]
join dbo.['2019$'] as e
on a.Country=e.[Country or region]


--LETS START JOINING AND LOOK AT THE INSIGHTS

--Happiness Rank by country and comaprison with each  2015 and 2016 year
create view HappinessRank1516 as 
Select A.Country, A.[Happiness Rank], B.[Happiness Rank], A.[Happiness Score], B.[Happiness Score]
from dbo.['2015$'] as A
join dbo.['2016$'] as B
	on A.Country = B.Country

--Happiness Rank by country and comaprison with each year
Select A.Country, A.[Happiness Rank], B.[Happiness Rank], C.[Happiness#Rank], D.[Overall rank], E.[Overall rank]
from dbo.['2015$'] as A
join dbo.['2016$'] as B
on A.Country = B.Country 
join dbo.['2017$'] as C
on A.Country = C.Country 
join dbo.['2018$'] as D
on A.Country = D.[Country or region] 
join dbo.['2019$'] as E
on A.Country = E.[Country or region]
	
--Looking at corruption level of each country per year
Select A.Country, A.[Trust (Government Corruption)], B.[Trust (Government Corruption)], C.Trust##Government#Corruption#, D.[Perceptions of corruption], E.[Perceptions of corruption]
from dbo.['2015$'] as A
join dbo.['2016$'] as B
on A.Country = B.Country 
join dbo.['2017$'] as C
on A.Country = C.Country 
join dbo.['2018$'] as D
on A.Country = D.[Country or region] 
join dbo.['2019$'] as E
on A.Country = E.[Country or region]


	
--creating views for later visualizations
create view ScoreVsFreedom1 as 
Select Country, [Happiness Rank], [Happiness Score], Freedom, ROUND((Freedom/[Happiness Score])*100,2) as ScoreVsFreedom
from dbo.['2015$']

create view ScoreVsFreedom2 as 
Select Country, [Happiness Rank], [Happiness Score], Freedom, ROUND((Freedom/[Happiness Score])*100,2) as ScoreVsFreedom
from dbo.['2016$']

create view ScoreVsFreedom3 as 
Select Country, [Happiness#Rank], [Happiness#Score], Freedom, ROUND((Freedom/[Happiness#Score])*100,2) as ScoreVsFreedom
from dbo.['2017$']

create view ScoreVsFreedom4 as 
Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], ROUND(([Freedom to make life choices]/[Score])*100,2) as ScoreVsFreedom
from dbo.['2018$']

create view ScoreVsFreedom5 as 
Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], ROUND(([Freedom to make life choices]/[Score])*100,2) as ScoreVsFreedom
from dbo.['2019$']