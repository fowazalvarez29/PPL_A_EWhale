CREATE VIEW vw_total_waste_points_per_category AS
SELECT 
    w.category,
    SUM(pd.quantity) AS total_waste_collected,
    SUM(pd.points) AS total_points_collected
FROM 
    pickup_detail pd
JOIN 
    waste w ON pd.waste_id = w.waste_id
GROUP BY 
    w.category;
