

drop table [Football].[dbo].[Data];

select * ,

CASE 
WHEN competition ='EngPr' then 'Premier League'
WHEN competition ='ItaSA' then 'Serie A'
WHEN competition ='NetED' then 'Eredivisie'
WHEN competition ='SpaPr' then 'La Liga'
WHEN competition ='FraL1' then 'Ligue 1'
WHEN competition ='GerBL1' then 'Bundesliga'
WHEN competition ='EurUCL' then 'Champions League'
WHEN competition ='EurUEL' then 'Europa League'
WHEN competition ='UsaMLS' then 'Major League Soccer'
else 'X'
end as competition_fullname,

CASE 
WHEN competition ='EngPr' then 1
WHEN competition ='ItaSA' then 2
WHEN competition ='NetED' then 3
WHEN competition ='SpaPr' then 4
WHEN competition ='FraL1' then 5
WHEN competition ='GerBL1' then 6
WHEN competition ='EurUCL' then 7
WHEN competition ='EurUEL' then 8
WHEN competition ='UsaMLS' then 9
else 999
end as competitionindex,

case when ShotZone1 in ('L11','L12','L13','L21','L22','L23','R11','R12','R13','R21','R22','R23')
           then 'Penalty-Side'
      when ShotZone1 in ('L31','L32','L33','R31','R32','R33')
           then '18Yard-Side'
	  when ShotZone1 in ('M11','M12','M13')
           then '6Yard'
	  when ShotZone1 in ('M21','M22','M23')
           then 'Penalty-Centre'
	  when ShotZone1 in ('M31','M32','M33')
           then '18Yard-Centre'
		   else Shotzone1 
		   end as ShotZoneText,
case when type in ('Direct free kick','Direct Free-Kick') then 'Y' else 'N' end as FreeKickFlag,
case when type in ('Direct free kick','Direct Free-Kick') then 'Y'
     when primaryType like ('%Corner%') then 'Y' else 'N' end as SetPieceFlag,
row_number() over (order by competition,kickoffdate,gsm_id,matchminute,player,location_x_num,location_y_num)
as keyid_final
into   [Football].[dbo].[Data]
from  [Football].[dbo].[Data01]
;




select count(*)from  [Football].[dbo].[Data01]
