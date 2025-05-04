--Büntetők száma szezon és csapat szerint, továbbá külön szezon és külön csapat szerint

SELECT 
    t.team_name,
    s.season,
    SUM(st.penalty) AS "Büntetők száma"
FROM matches m
JOIN stats st ON m.stats_id = st.stats_id
JOIN teams t ON m.home_team_id = t.team_id
JOIN seasons s ON m.season_id = s.season_id
GROUP BY GROUPING SETS (
    (t.team_name, s.season),
    (t.team_name),
    (s.season)
);