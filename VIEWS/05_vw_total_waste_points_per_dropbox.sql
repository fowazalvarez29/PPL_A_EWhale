CREATE VIEW vw_total_waste_points_per_dropbox AS
SELECT 
    d.name AS dropbox_name,
    SUM(pd.quantity) AS total_waste_collected,
    SUM(pd.points) AS total_points_collected
FROM 
    dropbox d
JOIN 
    pickup_waste pw ON d.dropbox_id = pw.dropbox_id
JOIN 
    pickup_detail pd ON pw.pickup_id = pd.pickup_id
GROUP BY 
    d.name;
