-- get all wallets for user_id = 9
SELECT u.collection_id as user_id, w.address as wallet_id FROM user as u
    JOIN wallet_link as w ON u.collection_id = w.collection_id
    WHERE user_id = 9;

-- get sum of wallet balance for user_id = 9
SELECT u.collection_id as user_id, sum(w.balance) as wallet_balance FROM user as u
    LEFT JOIN wallet_link as w ON u.collection_id = w.collection_id
    GROUP BY w.collection_id, u.collection_id
    HAVING user_id = 9;

