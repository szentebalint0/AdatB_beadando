--Hazai csapat előző meccsének gólszáma külön oszlopban

SELECT 
    m.match_id,
    ht.team_name AS home_team,
    g.home_goals,
    LAG(g.home_goals,1,"Nincs előző adat") OVER (PARTITION BY m.home_team_id ORDER BY m.match_id) AS "Előző meccs gólszáma"
FROM matches m
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN goals g ON m.goals_id = g.goals_id;