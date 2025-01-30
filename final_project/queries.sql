-- Database exploration
-- Find all listing of a given username
SELECT *
FROM "listing"
WHERE
    "listing"."seller_id" IN (
        SELECT "id"
        FROM "users"
        WHERE "username" = 'John'
    );

-- Find top 10 users with the most listing
SELECT
    "users"."username" AS "Usernames",
    COUNT("listing"."id") AS "Number of listings"
FROM "users"
JOIN "listing" ON "users"."id" = "listing"."seller_id"
GROUP BY "users"."usernames"
ORDER BY
    "Number of listings" DESC,
    "Usernames" ASC
LIMIT 10;

-- Find top 10 listing with the highest listing selling price
SELECT
    "name",
    "users"."username" AS "Seller",
    "listing_price"
FROM "listing"
JOIN "users" ON "users"."id" = "listing"."seller_id"
ORDER BY
    "listing_price" DESC,
    "Seller" ASC
LIMIT 10;

-- Find what user makes the most number of payment
SELECT
    "users"."username" AS "Username",
    COUNT("wallet_history"."id") AS "Number of Payments"
FROM "users"
JOIN "wallet" ON "users"."id" = "wallet"."user_id"
JOIN "wallet_history" ON "wallet"."id" = "wallet_history"."wallet_id"
WHERE "wallet_history"."transaction_type" = 'payment'
GROUP BY "users"."username"
ORDER BY "Number of Payments" DESC
LIMIT 1;

-- Insert new users
INSERT INTO "users" ("first_name", "middle_name", "last_name", "username", "password", "email")
VALUES
    ('James', NULL, 'Junior', 'JnJ', '123456', 'james.junior@gmail.com'),
    ('Richard', 'L.', 'Thornaby', 'RLT', 'Rutherf00rd', 'r.l.t@gmail.com')
    ('Emily', NULL, 'Chapman', 'Emilly42', 'E4mi11y', 'emilty.chap@yahoo.com');

-- Top up wallet
UPDATE `wallet`
SET `balance` = `balance` + 50.00
WHERE
    `user_id` = 1 AND
    `balance` + 50.00 >= 0;



