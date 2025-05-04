--Melyik meccsen volt a legtöbb lap, a piros lap kettőt ér

SELECT 
    m.match_id,
    s.season,
    ht.team_name AS home_team,
    at.team_name AS away_team,
    st.yellow_card,
    st.red_card,
    (st.yellow_card + 2 * st.red_card) AS lapszám
FROM matches m
JOIN stats st ON m.stats_id = st.stats_id
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id
JOIN seasons s ON m.season_id = s.season_id
ORDER BY lapszám DESC
LIMIT 1;