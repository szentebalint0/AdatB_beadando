CREATE TABLE matches (
    match_id     INTEGER PRIMARY KEY,
    season_id    INTEGER NOT NULL
                         REFERENCES seasons (season_id),
    home_team_id INTEGER REFERENCES teams (team_id) 
                         NOT NULL,
    away_team_id INTEGER REFERENCES teams (team_id) 
                         NOT NULL,
    goals_id     INTEGER NOT NULL
                         REFERENCES goals (goals_id),
    stats_id     INTEGER NOT NULL
                         REFERENCES stats (stats_id) 
);