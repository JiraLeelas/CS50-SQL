## Database Design Document

By Jira Leelasoontornwatana
Submission Video: https://youtu.be/G3-CMhwj3RE

## Scope

The purpose of this database is to create a user-to-user selling platform for second-hand items. It will store information about users, their item listings, transaction history between users, and other supportive functions that facilitate transactions.

## Representation

The entities in this database are represented with SQLite.

### Entities

The database includes the following entities:

#### Users

The `users` table includes:
* `id` unique ID for users as an `INTEGER`, which is the `PRIMARY KEY`.
* `first_name` specifies the registered user's first name as `VARCHAR` with a length of 64.
* `middle_name` specifies the registered user's middle name as `VARCHAR` with a length of 32
* `last_name` specifies the registered user's last name as `VARCHAR` with a length of 64.
* `username` specifies the registered user-created username as `VARCHAR` with a length of 32. To prevent duplication between accounts, each username has a `UNIQUE` constraint is applied.
* `password` specifies the registered user-created password as `VARCHAR` with a length of 255 to support hash password.
* `email` specifies the user registered email as `VARCHAR` with a length of 128. To prevent one user from creating multiple accounts, each email can only be used once. Thus, the `UNIQUE` constraint is applied.
All columns in the `users` table are required. Thus, the `NOT NULL` constraint is applied.

#### Wallet

The `wallet` table includes:
* `id` unique ID for wallets as an `INTEGER`, which is the `PRIMARY KEY`.
* `user_id` specifies the ID of the user as an `INTEGER`. This is the `FOREIGN KEY` referencing the `id` column in the `users` table. This is the `FOREIGN KEY` referencing the `id` column in the `users` table. As each user has one wallet, the `UNIQUE` constraint is applied.
* `balance` specifies the user wallet balance as `DECIMAL` which has 12 maximum precision and 2 decimals. The listing price should not be a negative number.
* `last_update` provides the information on the last updated time of the wallet having `DATETIME` format with the default value being the `CURRENT_TIMESTAMP`.

#### Wallet History

The `wallet_history` table includes:
* `id` unique ID for wallets as an `INTEGER`, which is the `PRIMARY KEY`.
* `wallet_id` specifies the ID of the wallet as an `INTEGER`. This is the `FOREIGN KEY` referencing the `id` column in the `wallet` table. This is the `FOREIGN KEY` referencing the `id` column in the `wallet` table.
* `transaction_id` specifies the unique ID that the wallet history associated with the listing transaction. The default for this is null. In each transaction there should be two generated `wallet_history` as one wallet pays another wallet receives the income.
* `transaction_type` provides the category of the wallet transaction using `ENUM`. This includes ('topup', 'withdraw', 'income', and 'payment').
* `amount` specifies the user wallet balance as `DECIMAL` which has 12 maximum precision and 2 decimals. The listing price should not be a negative number and must be more than zero.
* `transcation_date` provides the information on the wallet transaction history with a `DATETIME` stamp with the default value being the `CURRENT_TIMESTAMP()`.

#### listing

The `listing` table includes:
* `id` unique ID for listed items as an `INTEGER`, which is the `PRIMARY KEY`.
* `seller_id` specifies the ID of the user who listed the items as an `INTEGER`. This is the `FOREIGN KEY` referencing the `id` column in the `users` table.
* `name` provides the name of the product as `VARCHAR` with a length of 64.
* `description` provides the description of the product as `VARCHAR` with a length of 512.
* `category` provides the category that this item belongs to using `ENUM`. The product types that include ('Books', 'Business & Industrial', 'Collectibles', 'Consumables', 'Fashion', 'Electronics', 'Sports', 'Home & DIY', 'Others').
* `listing_price` specifies the listing price as `DECIMAL` which has 12 maximum precision and 2 decimals. The listing price should not be a negative number.
* `listing_timestamp` provides the information on the listing timestamp of the item listing having `DATETIME` format with the default value being the `CURRENT_TIMESTAMP`.
All columns in the `users` table are required. Thus, the `NOT NULL` constraint is applied.

#### Transactions

The `transactions` table includes:
* `id` unique ID for transactions as an `INTEGER`, which is the `PRIMARY KEY`.
* `listing_id` specifies the ID of the listing of the items as an `INTEGER`. This is the `FOREIGN KEY` referencing the `id` column in the `users` table.
* `buyer_id` specifies the ID of the user who buys the items as an `INTEGER`. This is the `FOREIGN KEY` referencing the `id` column in the `users` table.
* `transaction_timestamp` provides the information on the transaction timestamp having `DATETIME` format with the default value being the `CURRENT_TIMESTAMP`.

### Relationships

The below entity relationship diagram illustrates the relationship among the table entities in the database.
![ER Diagram](ER_Diagram.png)
ER Diagram rationale:
* One user owns one wallet unique to them.
* One user is capable of listing zero to many numbers of listings. Users can choose to sell using the listing table or not to sell any products.
* One user (buyer) can buy one listing. This action will create one transaction between the listing and a buyer (user). Moreover, this one transaction will update multiple wallet histories, as there is an account receiving money and one account sending the money.
* One wallet will have multiple wallet histories as this can come from actions such as top-ups and transactions.

## Optimizations

To optimize the transaction system, as demonstrated in `queries.sql`, indexes are created on the `username` and `id` columns of the `users` table to support frequent searches by username or ID. Since this is a selling platform, the `seller_id` of the `listing` table and `listing_id` of the `transactions` indexes are created to accommodate the process of searching seller who listed a specific listing.

## Limitations

* This database does not support other sales methods (e.g. bidding or trading). Also, it does not have an inventory system that supports users to buy a number of items for a particular product.
* The current schema utilizes a simple transaction system that undermines the complexity and choice of payments available. To scale up this system, a more comprehensive payment system is suggested.

