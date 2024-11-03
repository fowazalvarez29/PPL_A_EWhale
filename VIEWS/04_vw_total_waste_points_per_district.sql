CREATE VIEW vw_total_waste_points_per_district AS
SELECT 
    pw.district_address,
    SUM(pd.quantity) AS total_waste_collected,
    SUM(pd.points) AS total_points_collected
FROM 
    pickup_waste pw
JOIN 
    pickup_detail pd ON pw.pickup_id = pd.pickup_id
GROUP BY 
    pw.district_address;
