CREATE OR REPLACE VIEW vw_top_10_waste_types AS
SELECT 
    w.waste_name,
    COALESCE(SUM(pd.quantity), 0) AS total_collected
FROM 
    waste w
LEFT JOIN 
    pickup_detail pd ON w.waste_id = pd.waste_id
GROUP BY 
    w.waste_id
ORDER BY 
    total_collected DESC
LIMIT 10;