USE [Football]
GO



drop table [Football].[dbo].[Data_XAssists_map];
select *,
coalesce(locx,primarylocx) as locx_FF,
coalesce(locy,primarylocy) as locy_FF

 into [Football].[dbo].[Data_XAssists_map]
from
(
select *,
location_x_Num as locx,location_y_Num as locy,
null as primarylocx,null as primarylocy,'shot' as datatype 
from [dbo].[Data_XGoals]

union all

select *,
null as locx,null as locy,
primaryLocation_x_Num as primarylocx,primaryLocation_y_Num as primarylocy,
'pass' as datatype 
from [dbo].[Data_XGoals]
)a1
--where rownames=22123
