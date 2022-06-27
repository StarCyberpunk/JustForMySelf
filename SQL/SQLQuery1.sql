SELECT dir.[id],dir.[Name]
  FROM [MovieDB].[dbo].[Director] as dir 
Left OUTER JOIN [MovieDB].[dbo].[Movie] as mov ON mov.[DirectorId]=dir.[id] where mov.[DirectorId] is null
order by dir.[Name]