--Csapatonkénti döntetlenek kategorizálása

SELECT 
    team_name,
    SUM(dontetlen) AS "Dönetlenek száma",
    IIF(SUM(dontetlen) > 10, '10-nél több', '10 vagy kevesebb') AS Kategória
FROM (
    SELECT 
        t.team_name,
        COUNT(*) AS dontetlen
    FROM matches m
    JOIN goals g ON m.goals_id = g.goals_id
    JOIN results r ON g.result_id = r.result_id
    JOIN teams t ON m.home_team_id = t.team_id
    WHERE r.description = 'Döntetlen'
    GROUP BY t.team_name

    UNION ALL

    SELECT 
        t.team_name,
        COUNT(*) AS dontetlen
    FROM matches m
    JOIN goals g ON m.goals_id = g.goals_id
    JOIN results r ON g.result_id = r.result_id
    JOIN teams t ON m.away_team_id = t.team_id
    WHERE r.description = 'Döntetlen'
    GROUP BY t.team_name
)
GROUP BY team_name
ORDER BY 2 DESC,1;