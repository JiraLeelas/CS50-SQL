/* Users */
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name`VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password`VARCHAR(32) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

/* School and Universities */
CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM(`Primary`, `Secondary`, `Higher Education`) NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` YEAR(4) NOT NULL,
    PRIMARY KEY(`id`)
)

/* Companies */
CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM(`Technology`, `Education`, `Business`) NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
)

/* Connections */
CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user1_id` INT,
    `user2_id` INT,
    `school_id` INT,
    `company_id` INT,
    `school_start` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `school_end` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `school_degree` ENUM(`BA`, `MA`, `PhD`) NOT NULL,
    `company_start` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `company_end` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
)
