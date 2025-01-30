CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "edu_institutions" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('Elementary School',
        'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL CHECK("industry" IN ('Education', 'Technology', 'Finance')),
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "id" INTEGER,
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    "school_id" INTEGER,
    "company_id" INTEGER,
    "edu_start" NUMERIC NOT NULL,
    "edu_grad" NUMERIC NOT NULL,
    "degree" TEXT NOT NULL CHECK("degree" IN ('BA', 'MA', 'PhD')),
    "comp_start" NUMERIC NOT NULL,
    "comp_end" NUMERIC NOT NULL,
    "comp_title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "edu_institutions"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);