SELECT
    "districts"."name" AS "Name",
    "expenditures"."per_pupil_expenditure" AS "Per Pupil Expenditure"
FROM
    "districts"
JOIN
    "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE
    "type" LIKE 'Public School District'
ORDER BY
    "Per Pupil Expenditure" DESC
LIMIT 10;
