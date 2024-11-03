CREATE VIEW vw_total_waste_points_per_category AS
SELECT 
    wt.waste_type_name,
    COALESCE(SUM(pd.quantity), 0) AS total_waste_collected,
    COALESCE(SUM(pd.points),0) AS total_points_collected
FROM 
    waste_type wt
JOIN 
    waste w ON wt.waste_type_id = w.waste_type_id
JOIN
	pickup_detail pd ON w.waste_id = pd.waste_id
GROUP BY 
    wt.waste_type_name;
