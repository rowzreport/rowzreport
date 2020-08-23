


/*
drop table [Football].[dbo].[FootballData_UEL_mins_1718];
drop table [Football].[dbo].[FootballData_UCL_mins_1718];
drop table [Football].[dbo].[FootballData_ENG_mins_1718];
drop table [Football].[dbo].[FootballData_ITA_mins_1718];
drop table [Football].[dbo].[FootballData_NED_mins_1718];
*/



drop table [Football].[dbo].[MinutesData];

SELECT *,
case when competition='UsaMLS' and substring(season,1,4)='2017' then '17-18' 
	when competition='UsaMLS' and substring(season,1,4)='2018' then '18-19' 
    when substring(season,1,4)='2016' then '16-17' 
	 when substring(season,1,4)='2017' then '17-18' 
	else '18-19'
end as Season1 ,
mins_played*1 as minutes_played,

case when lower(competition) like ('%net%') and 
		year(kick_off_dt)=2017 and month(kick_off_dt)=5 and day(kick_off_dt)>16	then 'Playoff' 
	when lower(competition) like ('%net%') and 
		year(kick_off_dt)=2018 and month(kick_off_dt)=5 and day(kick_off_dt)>8	then 'Playoff' 		
		else 'League' end as matchType

INTO [Football].[dbo].[MinutesData]
from(
select * from [Football].[dbo].[FootballData_ENG_minutes_1617]
union all
select * from [Football].[dbo].[FootballData_ITA_mins_1617]
union all
select * from [Football].[dbo].[FootballData_NED_mins_1617]
union all
select * from [Football].[dbo].[FootballData_FRA_mins_1617]
union all
select * from [Football].[dbo].[FootballData_GER_mins_1617]
union all
select * from [Football].[dbo].[FootballData_SPA_mins_1617]
union all
select * from [Football].[dbo].[FootballData_UCL_mins_1617]
union all
select * from [Football].[dbo].[FootballData_UEL_mins_1617]

union all
select * from [Football].[dbo].[FootballData_ENG_mins_1718]
union all
select * from [Football].[dbo].[FootballData_ITA_mins_1718]
union all
select * from [Football].[dbo].[FootballData_NED_mins_1718]
union all
select * from [Football].[dbo].[FootballData_FRA_minutes_1718$]
union all
select * from [Football].[dbo].[FootballData_GER_minutes_1718$]
union all
select * from [Football].[dbo].[FootballData_SPA_minutes_1718$]
union all
select * from [Football].[dbo].[FootballData_UCL_mins_1718]
union all
select * from [Football].[dbo].[FootballData_UEL_mins_1718]

union all
select * from [Football].[dbo].[FootballData_USA_mins_1617]
union all
select * from [Football].[dbo].[FootballData_USA_mins_1718]

union all
select * from [Football].[dbo].[FootballData_ENG_minutes_1819]
union all
select * from [Football].[dbo].[FootballData_ITA_mins_1819]
union all
select * from [Football].[dbo].[FootballData_NED_mins_1819]
union all
select * from [Football].[dbo].[FootballData_FRA_minutes_1819]
union all
select * from [Football].[dbo].[FootballData_GER_minutes_1819]
union all
select * from [Football].[dbo].[FootballData_SPA_minutes_1819]
union all
select * from [Football].[dbo].[FootballData_UCL_mins_1819]
union all
select * from [Football].[dbo].[FootballData_UEL_mins_1819]
)a


