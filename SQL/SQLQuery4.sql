
CREATE TABLE CUSTOMERS(
  Zodiac   nchar(20)    NOT NULL,
  Date Start date    NOT NULL,
  Date End  date    NOT NULL,
);




select name,BirthDate,DATEDIFF(year,acc.BirthDate,GETDATE()) as Age,zoc.Zodiac,movesss.Directors as CountDir
from [MovieDB].[dbo].[Actor] as acc,
(select ac.id, zodiac from [MovieDB].[dbo].[Actor] as ac
join [MovieDB].[dbo].[Zodiacs] as zod on 
(MONTH( ac.BirthDate)=MONTH(zod.[Date Start]) and DAY( ac.BirthDate)>=DAY(zod.[Date Start]) or
(MONTH( ac.BirthDate)=MONTH(zod.[Date End])) and (DAY( ac.BirthDate)<=DAY(zod.[Date End]))) ) as zoc,
(select Directors,ActorId from  
(select Count(gt.Directors) as Directors,gt.ActorId from
(select  DISTINCT mo.DirectorId as Directors,dir.ActorId from [MovieDB].[dbo].[Movie] as mo
, [MovieDB].[dbo].[MovieActor] as dir where (mo.DurationMinutes>120 and mo.Rating>=6.5) and dir.MovieId=mo.id ) as gt
group by gt.ActorId) as gtt
where Directors>1) as movesss
where zoc.id=acc.id and movesss.ActorId=acc.id
order by BirthDate DESC