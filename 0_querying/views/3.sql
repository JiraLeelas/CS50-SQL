SELECT COUNT(*) AS [Count_Fuji] 
FROM "views" 
WHERE 
    ("english_title" LIKE "%Fuji%" AND "artist" = 'Hokusai');