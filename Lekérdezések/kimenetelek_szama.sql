--Adott kimenetekkel hány meccs végződött

SELECT 
    r.description AS "Kimenetel",
    COUNT(*) AS "Meccsek száma"
FROM matches m
JOIN goals g ON m.goals_id = g.goals_id
JOIN results r ON g.result_id = r.result_id
GROUP BY r.description
ORDER BY "Meccsek száma" DESC;