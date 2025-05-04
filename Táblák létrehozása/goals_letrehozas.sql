CREATE TABLE goals (
    goals_id   INTEGER PRIMARY KEY,
    home_goals INTEGER,
    away_goals INTEGER,
    result_id  INTEGER NOT NULL
                       REFERENCES results (result_id) 
);