SELECT
    "districts"."name" AS "Name",
    "expenditures"."per_pupil_expenditure" AS "Per Pupil Expenditure",
    "staff_evaluations"."exemplary" AS "Exemplary Rating"
FROM
    "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE
    "districts"."type" = 'Public School District' AND
    "Per Pupil Expenditure" > (
        SELECT AVG("per_pupil_expenditure")
        FROM "expenditures"
        ) AND
    "Exemplary Rating" > (
        SELECT AVG("exemplary")
        FROM "staff_evaluations"
        )
ORDER BY
    "Exemplary Rating" DESC,
    "Per Pupil Expenditure" DESC;
