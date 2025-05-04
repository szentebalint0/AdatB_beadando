--Melyik meccseken volt több sárgalap mint az átlag?

SELECT 
    m.match_id,
    season,
    ht.team_name AS home_team,
    at.team_name AS away_team,
    st.yellow_card
FROM matches m
JOIN stats st ON m.stats_id = st.stats_id
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id
JOIN seasons s ON m.season_id = s.season_id
WHERE st.yellow_card > (
    SELECT AVG(yellow_card)
    FROM stats
);