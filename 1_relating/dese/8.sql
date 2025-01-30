SELECT
    "districts"."name" AS "Names",
    "expenditures"."pupils" AS "Count"
 FROM
    "districts"
 JOIN
    "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY
    "districts"."name"
ORDER BY
    "Names" ASC,
    "Count" DESC;
