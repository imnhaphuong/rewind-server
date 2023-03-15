-- name: CreateItem :one
INSERT INTO items (
    name, 
    price, 
    description
) VALUES (
    $1, $2, $3
)
RETURNING *;
