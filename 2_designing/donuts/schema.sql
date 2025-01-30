CREATE TABLE "ingredients" (
    "id" INTEGER,
    "flour" NUMERIC,
    "yeast" NUMERIC,
    "oil" NUMERIC,
    "butter" NUMERIC,
    "sugar" NUMERIC,
    "flour_ppu" NUMERIC,
    "yeast_ppu" NUMERIC,
    "oil_ppu" NUMERIC,
    "butter_ppu" NUMERIC,
    "suagr_ppu" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "ingredients_id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('gluten-free')),
    "price_per_donut" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "donuts_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("donuts_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);
