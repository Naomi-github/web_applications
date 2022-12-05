DROP TABLE IF EXISTS peeps;

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    peep text,
    time_stamp text,
    user_id int
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("peep", "time_stamp", "user_id") VALUES
("Naomi's first peep", "time", 1 )
('Jane is peeping', 'time', 2)

