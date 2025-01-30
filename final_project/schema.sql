-- User-to-user selling system

-- Users
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(64) NOT NULL,
    `middle_name` VARCHAR(32) DEFAULT NULL,
    `last_name` VARCHAR(64) NOT NULL,
    `username` VARCHAR(64) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

-- Wallet
CREATE TABLE `wallet` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL UNIQUE,
    `balance` DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (`balance` >= 0),
    `last_update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- Wallet History
CREATE TABLE `wallet_history` (
    `id` INT AUTO_INCREMENT,
    `wallet_id` INT NOT NULL,
    `transaction_id` INT DEFAULT NULL,
    `transaction_type` ENUM('topup', 'withdraw', 'income', 'payment') NOT NULL,
    `amount` DECIMAL(12,2) NOT NULL CHECK(`amount` > 0),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`wallet_id`) REFERENCES `wallet`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`)
);

-- Listing
CREATE TABLE `listing` (
    `id` INT AUTO_INCREMENT,
    `seller_id` INT NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `description` VARCHAR(512) NOT NULL,
    `category` ENUM('Books', 'Business & Industrial', 'Collectibles', 'Consumables', 'Fashion', 'Electronics', 'Sports', 'Home & DIY', 'Others') NOT NULL,
    `listing_price` DECIMAL(12,2) NOT NULL CHECK (`listing_price` > 0),
    `listing_timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`seller_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- Transactions
CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `listing_id` INT NOT NULL,
    `buyer_id` INT NOT NULL,
    `transaction_timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`listing_id`) REFERENCES `listing`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`buyer_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- Auto create wallet when new user is added
delimiter //
CREATE TRIGGER `create_wallet_for_user`
AFTER INSERT ON `users`
FOR EACH ROW
BEGIN
    INSERT INTO `wallet` (`user_id`, `balance`)
    VALUES (NEW.id, 0.00);
END//
delimiter ;


-- Indexing Optimizations
CREATE INDEX "username_search" ON "users" ("username");
CREATE INDEX "user_id_search" ON "users" ("id");
CREATE INDEX "seller_id_search" ON "listing"("seller_id");
CREATE INDEX "listing_id_search" ON "transactions"("listing_id");


-- Common View User Montly Transaction
CREATE VIEW "user_transaction_monthly_transaction" AS
SELECT
    "user"."id" AS "User_id",
    YEAR("transaction"."transaction_timestamp") AS "Transaction_Year",
    MONTH("transaction"."transaction_timestamp") AS "Transaction_Month",
    SUM("listing"."listing_price") AS "Total_Monthly_Spending"
FROM "transactions"
JOIN "users" ON "users"."id" = "transactions"."buyer_id"
LEFT JOIN "listing" ON "listing"."id" = "transactions"."listing_id"
GROUP BY
    "User_id",
    "Transaction_Year",
    "Transaction_Month"
ORDER BY
    "User_id" ASC,
    "Transaction_Year" ASC,
    "Transaction_Month" ASC;
