select Name from (
select ss1.MovieId,ss1.ActorId from
(select [MovieDB].[dbo].[MovieActor].ActorId ,[MovieDB].[dbo].[MovieActor].MovieId
from [MovieDB].[dbo].[MovieActor]
where MovieId=1 ) as ss1
Left OUTER join (select [MovieDB].[dbo].[MovieActor].ActorId ,[MovieDB].[dbo].[MovieActor].MovieId
from [MovieDB].[dbo].[MovieActor]
where MovieId=2 ) as ss2 on ss1.ActorId=ss2.ActorId where ss2.MovieId is null) as ss3 
join [MovieDB].[dbo].[Actor] as ss22 on ss3.ActorId=ss22.id 
order by Name ASC