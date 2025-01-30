
-- *** The Lost Letter ***
/*
sender: 900 Somerville Avenue
reciept: 2 Finnegan Street, uptown
content: congratulatory letter
Question: Deliver Status?
*/

-- Check for reciepient -> unsuccessful
SELECT "id" FROM "addresses" WHERE "address" = '2 Finnegan Street';
-- Check for the acutal content -> success
SELECT * FROM "packages" WHERE "contents" LIKE '%congratulatory%';
-- Matching the package with the scan table
SELECT * FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "contents" LIKE '%congratulatory%');
-- Check the address_id '854'
SELECT * FROM "addresses" WHERE "id" = 854;


-- *** The Devious Delivery ***
/*
Sender" Fiftyville, No From Address -> NULL
content" duck?
*/
-- Search through the content
SELECT * FROM "packages" WHERE ("contents" LIKE '%duck%' AND "from_address_id" IS NULL);
-- Search for the "to_address"
SELECT * FROM "scans" WHERE "package_id" = 5098;
SELECT * FROM "addresses" WHERE "id" = 348;

-- *** The Forgotten Gift ***
/*
from: 109 Tileston Street
recipient: 728 Maple Place
*/
-- From 9873
SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street';
-- To 4983
SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place';
-- Find package id - 9523
SELECT "id" FROM "packages" WHERE "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street') AND "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place');
-- Find status
SELECT * FROM "scans" WHERE "package_id" = 9523;
