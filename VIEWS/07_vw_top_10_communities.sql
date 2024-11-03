CREATE VIEW vw_top_10_communities AS
SELECT 
    cm.name AS community_name,
    COUNT(pw.pickup_id) AS total_pickups
FROM 
    community cm
JOIN 
    pickup_waste pw ON cm.community_id = pw.community_id
GROUP BY 
    cm.community_id
ORDER BY 
    total_pickups DESC
LIMIT 10;
