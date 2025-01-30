

/* Users prevent from re-opening a message ID 151 */
SELECT
    "expires_timestamp"
FROM
    "messages"
WHERE
    "id" = 151;
