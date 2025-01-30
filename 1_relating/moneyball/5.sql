SELECT
    DISTINCT("teams"."name")
FROM "performances"
JOIN "players" ON "performances"."player_id" = "players"."id"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE
    "players"."first_name" = 'Satchel' AND
    "players"."last_name" = 'Paige';
