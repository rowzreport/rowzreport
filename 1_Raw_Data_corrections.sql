

drop table [Football].[dbo].[Data_woShotZone];

select *,

year(kickoffDate)*10000 + month(kickoffdate)*100+day(kickoffdate) as datenum,

case when competition='UsaMLS' and (year(kickoffDate)*100 + month(kickoffdate)) < 201801
		then '17-18' 
	when competition='UsaMLS' and (year(kickoffDate)*100 + month(kickoffdate)) < 201901
		then '18-19' 
     when year(kickoffDate)*100 + month(kickoffdate) < 201707 
		then '16-17' 
	 when   year(kickoffDate)*100 + month(kickoffdate) < 201807 
		then '17-18'
	else '18-19' 
	end as Season,
	
cast(case when location_x='-' then '-999' else location_x end as float) as location_x_Num,
cast(case when location_y='-' then '-999' else location_y end as float) as location_y_Num,
cast(case when primaryLocation_x='-' then '-999' else primaryLocation_x end as float) as primaryLocation_x_Num,
cast(case when primaryLocation_y='-' then '-999' else primaryLocation_y end as float) as primaryLocation_y_Num,
cast(case when shotQuality in ('-','N/A') then '-999'  else shotQuality end as float) as shotQualityNum,
cast(case when defPressure in ('-','N/A') then '-999'  else defPressure end as float) as defPressureNum,
cast(case when numDefPlayers in ('-','N/A') then '-999'  else numDefPlayers  end as float) as numDefPlayersNum,
cast(case when numAttPlayers  in ('-','N/A') then '-999'  else numAttPlayers  end as float) as numAttPlayersNum,
case when outcome='-' then 'Goal' else outcome end as outcomeText,
case when outcome='-' then 1 else 0 end as goalFlag,

case when lower(competition) like ('%net%') and 
		year(kickoffDate)=2017 and month(kickoffdate)=5 and day(kickoffdate)>16	then 'Playoff' 
	when lower(competition) like ('%net%') and	year(kickoffDate)=2018 and month(kickoffdate)=5 and day(kickoffdate)>8	then 'Playoff' 			
		else 'League' 
		end as matchType,

case when hometeam_team1=team then awayteam_team2 else hometeam_team1 end as teamAgainst,
case when hometeam_team1=team then 'Home' else 'Away' end as homeAway,
case when chanceRating='Penalty' then 1 
     when chanceRating='-'       then 1 else 0 end as penaltyExclusion,

case when lower(chanceRating) like ('%superb%') then 'Superb'
     when lower(chanceRating) like ('%great%') then 'Great'
	 when lower(chanceRating) like ('%very%') then 'VeryGood'
	 when lower(chanceRating) like ('%fair%') then 'Fair'
 	 when lower(chanceRating) like ('%poor%') then 'Poor'
 	 when lower(chanceRating) like ('%good%') then 'Good'
 	 when lower(chanceRating) like ('%penalty%') then 'Penalty'
 	 when chanceRating='-'  then 'Penalty'
	 else 'X' end as chanceRatingText,

case when lower(chanceRating) like ('%superb%') then 6
     when lower(chanceRating) like ('%great%') then 5
	 when lower(chanceRating) like ('%very%') then 4
	 when lower(chanceRating) like ('%fair%') then 2
 	 when lower(chanceRating) like ('%poor%') then 1
 	 when lower(chanceRating) like ('%good%') then 3
 	 when lower(chanceRating) like ('%penalty%') then 7
 	 when chanceRating='-'  then 7
	 else -9 end as chanceRatingNum,

((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 as matchminute,

	 
case when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 >0 and ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1<=45 then '1st Half'
     else										  '2nd Half'
	 end as matchHalf,
	 
case when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 >0 
			and ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1<=15 then '0-15'
     when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 <=30					then '15-30'
	 when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 <=45					then '30-45'
	 when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 <=60					then '45-60'
	 when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 <=75					then '60-75'
	 when ((substring(time,1,CHARINDEX(':',time,1)-1))*1)+1 >75					then '75-90'
	 else 'X'
	 end as matchQuarter

into [Football].[dbo].[Data_woShotZone]
from  [Football].[dbo].[Data_Raw] 
where left(location_x,1) in ('0','1','2','3','4','5','6','7','8','9','-')




select
competition,
max(datenum)
from
[Football].[dbo].[Data_woShotZone]
group by competition

