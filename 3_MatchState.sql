


drop table [Football].[dbo].[Data01];

select * 
into  [Football].[dbo].[Data01]
from
(

select *,case when matchstate0 is null then 0 else matchstate0 end as matchstate
from
(
select * ,
case when HomeAway='Home' then matchstate_home
     else matchstate_away
	 end as matchstate0
	 from
	 (

select *,

home_cum_goal - away_cum_goal as matchstate_home,
(home_cum_goal - away_cum_goal) * -1 as matchstate_away
from
(
SELECT 
*,

sum(case when  goalflag=1 and HomeAway='Home' then 1 else 0 end) 
		over (partition by gsm_id
					order by matchminute,time
					ROWS BETWEEN unbounded PRECEDING AND 1 preceding ) as home_cum_goal,
sum(case when  goalflag=1 and HomeAway='Away' then 1 else 0 end) 
		over (partition by gsm_id
					order by matchminute,time
					ROWS BETWEEN unbounded PRECEDING AND 1 preceding ) as away_cum_goal

  FROM [Football].[dbo].[Data_ShotZone]
  --here gsm_id=2240393

  )a
  )b
  )c
  )d