
select top (1)  Title,count
from
(SELECT  COUNT(ac.[ActorId]) as count,ac.[MovieId]
  FROM [MovieDB].[dbo].[MovieActor] as ac
  GROUP BY MovieId ) as te
  join [MovieDB].[dbo].[Movie] as mov on mov.id=MovieId
  order by count desc ,Title asc
  