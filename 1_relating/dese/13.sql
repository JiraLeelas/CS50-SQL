SELECT
    "districts"."name" AS "Name",
    "staff_evaluations"."unsatisfactory" AS "Bad"
FROM "districts"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
ORDER BY
    "Name" ASC,
    "Bad" DESC
LIMIT 10;