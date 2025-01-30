SELECT "english_title", "entropy" AS [Hokusai_Entropy] 
FROM "views" 
WHERE 
    "entropy" > (SELECT avg("entropy") FROM "views") AND "artist" = 'Hokusai' 
ORDER BY "entropy" DESC;