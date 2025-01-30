SELECT 
    "city", 
    COUNT("name") AS "Count"
FROM 
    "schools"
WHERE 
    "type" = 'Public School'
GROUP BY 
    "city"
ORDER BY 
    "Count" DESC, 
    "city" ASC
LIMIT 10;
