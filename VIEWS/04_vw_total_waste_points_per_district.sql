CREATE OR REPLACE VIEW vw_total_waste_points_per_district AS
SELECT 
    d.district_address,
    COALESCE(SUM(pd.quantity), 0) AS total_waste_collected,
    COALESCE(SUM(pd.points), 0) AS total_points_collected
FROM 
    dropbox d
LEFT JOIN 
    pickup_waste pw ON d.dropbox_id = pw.dropbox_id
LEFT JOIN 
    pickup_detail pd ON pw.pickup_id = pd.pickup_id
GROUP BY 
    d.district_address;

