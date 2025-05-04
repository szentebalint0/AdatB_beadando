--Hanyadik meccs a szezonban az adott meccs?

SELECT 
    m.match_id,
    s.season,
    ht.team_name AS home_team,
    at.team_name AS away_team,
    ROW_NUMBER() OVER (PARTITION BY m.season_id ORDER BY m.match_id) AS "Mérkőzés sorszáma a szezonban"
FROM matches m
JOIN seasons s ON m.season_id = s.season_id
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id;