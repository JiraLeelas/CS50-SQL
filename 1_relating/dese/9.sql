SELECT
    "districts"."name" AS "Name"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "districts"."name"
ORDER BY
    "expenditures"."pupils" ASC
LIMIT 1 ;