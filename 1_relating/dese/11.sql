SELECT
    "schools"."name" AS "Name",
    "expenditures"."per_pupil_expenditure" AS "Per Pupil Expenditure",
    "graduation_rates"."graduated" AS "Graduation Rates"
FROM
    "districts"
JOIN
    "schools" ON "districts"."id" = "schools"."district_id"
JOIN
    "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
JOIN
    "expenditures" ON "districts"."id" = "expenditures"."district_id"
ORDER BY
    "Per Pupil Expenditure" DESC,
    "Name" ASC
;
