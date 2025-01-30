/*Import the file*/
.import --csv meteorites.csv temp_met

/*Ideal Table Structure*/
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

/*Clean empty values*/
UPDATE "temp_met"
SET "mass" = NULL
WHERE "id" IN (
    SELECT "id"
    FROM "temp_met"
    WHERE "mass" = ''
);

UPDATE "temp_met"
SET "year" = NULL
WHERE "id" IN (
    SELECT "id"
    FROM "temp_met"
    WHERE "year" = ''
);

UPDATE "temp_met"
SET "lat" = NULL
WHERE "id" IN (
    SELECT "id"
    FROM "temp_met"
    WHERE "lat" = ''
);

UPDATE "temp_met"
SET "long" = NULL
WHERE "id" IN (
    SELECT "id"
    FROM "temp_met"
    WHERE "long" = ''
);

/* Round Columns */
UPDATE "temp_met"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

/*Remove rows with 'Relic' nametype*/

/*Sort by YEAR -> Name*/
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "temp_met"
WHERE "nametype" != 'Relict'
ORDER BY
    "year" ASC,
    "name" ASC;

