CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar(255) NOT NULL,
  "email" varchar(255) UNIQUE NOT NULL,
  "password" varchar(255) NOT NULL,
  "avatar" varchar(255) DEFAULT 'https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/02/avatar-hai-huoc-cute.jpg?ssl=1',
  "coin" int DEFAULT 0,
  "role" smallint DEFAULT 0,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "items" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(255) UNIQUE NOT NULL,
  "price" int DEFAULT 0,
  "description" varchar(255),
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "transactions" (
  "id" SERIAL PRIMARY KEY,
  "user_id" serial NOT NULL,
  "item_id" serial NOT NULL,
  "total" int DEFAULT 0,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

ALTER TABLE "transactions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");
