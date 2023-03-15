-- name: CreateTransaction :one
INSERT INTO transactions (
    user_id, 
    item_id,
    total
) VALUES (
    $1,$2, $3
)
RETURNING *;
