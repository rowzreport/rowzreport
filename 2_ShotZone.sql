USE [Football]
GO

drop table [Football].[dbo].[Data_ShotZone];

SELECT *,
case when location_x_num<=-300 then 'None'
     when  location_x_num < -81 and location_y_num <22 then '18Yard-Centre'
     when location_x_num < -81 and location_y_num <=66  then '18Yard-Centre'
	when location_x_num < -81 and location_y_num >66  then '18Yard-Centre'

when location_x_num >= -81 and location_x_num < -66
AND location_y_num <22  then 'R11'
when location_x_num >= -66 and location_x_num < -51
AND location_y_num <22  then 'R12'
when location_x_num >= -51 and location_x_num < -37
AND location_y_num <22  then 'R13'


when location_x_num >= -81 and location_x_num < -66
AND location_y_num <=66  then 'R21'
when location_x_num >= -66 and location_x_num < -51
AND location_y_num <=66  then 'R22'
when location_x_num >= -51 and location_x_num < -37
AND location_y_num <=66  then 'R23'


when location_x_num >= -81 and location_x_num < -66
AND location_y_num >66  then 'R31'
when location_x_num >= -66 and location_x_num < -51
AND location_y_num >66  then 'R32'
when location_x_num >= -51 and location_x_num < -37
AND location_y_num >66  then 'R33'

when location_x_num >= -37 and location_x_num < -12
AND location_y_num <22  then 'M11'
when location_x_num >= -12 and location_x_num < 12
AND location_y_num <22  then 'M12'
when location_x_num >= 12 and location_x_num < 37
AND location_y_num <22  then 'M13'


when location_x_num >= -37 and location_x_num < -12
AND location_y_num <=66  then 'M21'
when location_x_num >= -12 and location_x_num < 12
AND location_y_num <=66  then 'M22'
when location_x_num >= 12 and location_x_num < 37
AND location_y_num <=66  then 'M23'


when location_x_num >= -37 and location_x_num < -12
AND location_y_num >66  then 'M31'
when location_x_num >= -12 and location_x_num < 12
AND location_y_num >66  then 'M32'
when location_x_num >= 12 and location_x_num < 37
AND location_y_num >66  then 'M33'

when location_x_num >= 37 and location_x_num < 51
AND location_y_num <22  then 'L11'
when location_x_num >= 51 and location_x_num < 66
AND location_y_num <22  then 'L12'
when location_x_num >= 66 and location_x_num < 81
AND location_y_num <22  then 'L13'


when location_x_num >= 37 and location_x_num < 51
AND location_y_num <=66  then 'L21'
when location_x_num >= 51 and location_x_num < 66
AND location_y_num <=66  then 'L22'
when location_x_num >= 66 and location_x_num < 81
AND location_y_num <=66  then 'L23'

when location_x_num >= 37 and location_x_num < 51
AND location_y_num >66  then 'L31'
when location_x_num >= 51 and location_x_num < 66
AND location_y_num >66  then 'L32'
when location_x_num >= 66 and location_x_num < 81
AND location_y_num >66  then 'L33'


when location_x_num >= 81 
AND location_y_num <22  then '18Yard-Centre'
when location_x_num >= 81 
AND location_y_num <=66  then '18Yard-Centre'
when location_x_num >= 81 
AND location_y_num >66  then '18Yard-Centre'

ELSE 'X'
 end as ShotZone1
  
 into [Football].[dbo].[Data_ShotZone]
  FROM [Football].[dbo].[Data_woShotZone]


  
select Shotzone1,count(*)from  [Football].[dbo].[Data_ShotZone]
group by Shotzone1
