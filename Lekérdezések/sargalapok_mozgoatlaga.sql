--Csapatonkénti sárgalapok számának a mozgóátlaga, meccsenként sorbarendezve

SELECT 
    m.match_id,
    t.team_name,
    s.yellow_card,
    ROUND(AVG(s.yellow_card) OVER (
        PARTITION BY m.home_team_id
        ORDER BY m.match_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ),2) AS "Sárgalap mozgóátlag"
FROM matches m
JOIN teams t ON m.home_team_id = t.team_id
JOIN stats s ON m.stats_id = s.stats_id;