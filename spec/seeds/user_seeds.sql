DROP TABLE IF EXISTS users;

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name text,
    last_name text,
    email text,
    user_id in
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("first_name", "last_name", "email", "user_id") VALUES
('Naomi', 'Starr', '123@gmail.com', 1)
('Jane', 'Doe', 'JaneDoe@gmail.com', 2)
('Joe', 'Bloggs', 'JoBloggs@gmail.com', 3)
('Zoe', 'Nicole', 'ZoeNicole@gmail.com', 4)
