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
Select Country, [Happiness Rank], [Happiness Score], Freedom, ROUND((Freedom/[Happiness Score])*100,2) as ScoreVsFreedom
from dbo.['2015$']

Select Country, [Happiness Rank], [Happiness Score], Freedom, ROUND((Freedom/[Happiness Score])*100,2) as ScoreVsFreedom
from dbo.['2016$']

Select Country, [Happiness#Rank], [Happiness#Score], Freedom, ROUND((Freedom/[Happiness#Score])*100,2) as ScoreVsFreedom
from dbo.['2017$']

Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], ROUND(([Freedom to make life choices]/[Score])*100,2) as ScoreVsFreedom
from dbo.['2018$']

Select [Country or region], [Overall rank], [Score], [Freedom to make life choices], ROUND(([Freedom to make life choices]/[Score])*100,2) as ScoreVsFreedom
from dbo.['2019$']

--Looking at Score vs Trust
Select Country, [Happiness Rank], [Happiness Score], [Trust (Government Corruption)], ROUND(([Trust (Government Corruption)]/[Happiness Score])*100,2) as ScoreVsCorruption
from dbo.['2015$']

Select Country, [Happiness Rank], [Happiness Score], [Trust (Government Corruption)], ROUND(([Trust (Government Corruption)]/[Happiness Score])*100,2) as ScoreVsCorruption
from dbo.['2016$']

Select Country, [Happiness#Rank], [Happiness#Score], [Trust##Government#Corruption#], ROUND(([Trust##Government#Corruption#]/[Happiness#Score])*100,2) as ScoreVsCorruption
from dbo.['2017$']

Select [Country or region], [Overall rank], [Score],  [Perceptions of corruption], ROUND(([Perceptions of corruption]/[Score])*100,2) as ScoreVsCorruption
from dbo.['2018$']

Select [Country or region], [Overall rank], [Score],  [Perceptions of corruption], ROUND(([Perceptions of corruption]/[Score])*100,2) as ScoreVsCorruption
from dbo.['2019$']

--Looking at score vs GDP
Select Country, [Happiness Rank], [Happiness Score], [Economy (GDP per Capita)], ROUND(([Economy (GDP per Capita)]/[Happiness Score])*100,2) as ScoreVsGDP
from dbo.['2015$']

Select Country, [Happiness Rank], [Happiness Score], [Economy (GDP per Capita)], ROUND(([Economy (GDP per Capita)]/[Happiness Score])*100,2) as ScoreVsGDP
from dbo.['2016$']

Select Country, [Happiness#Rank], [Happiness#Score], [Economy##GDP#per#Capita#], ROUND(([Economy##GDP#per#Capita#]/[Happiness#Score])*100,2) as ScoreVsGDP
from dbo.['2017$']

Select [Country or region], [Overall rank], [Score], [GDP per Capita], ROUND(([GDP per Capita]/[Score])*100,2) as ScoreVsGDP
from dbo.['2018$']

Select [Country or region], [Overall rank], [Score], [GDP per Capita], ROUND(([GDP per Capita]/[Score])*100,2) as ScoreVsGDP
from dbo.['2019$']


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