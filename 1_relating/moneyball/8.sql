SELECT
    "salaries"."salary"
FROM
    "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE
    "salaries"."year" = 2001 AND
    "performances"."year" = 2001
ORDER BY
    "performances"."HR" DESC
LIMIT 1;