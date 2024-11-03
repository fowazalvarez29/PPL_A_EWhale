CREATE OR REPLACE VIEW view_total_pickup_history AS
SELECT 
    pw.pickup_id,
    pw.pickup_date,
    pw.pickup_address,
    pw.pickup_status,
    db.name AS 'Drop Box Name',
    db.district_address,
    wt.waste_type_name,
    SUM(pd.quantity) AS total_quantity,
    SUM(pd.points) AS total_points
FROM 
    pickup_waste pw
JOIN 
    pickup_detail pd ON pw.pickup_id = pd.pickup_id
JOIN 
    waste w ON pd.waste_id = w.waste_id
JOIN 
    waste_type wt ON w.waste_type_id = wt.waste_type_id
JOIN 
    dropbox db ON pw.dropbox_id = db.dropbox_id
GROUP BY 
    pw.pickup_id, 
    pw.pickup_date,
    pw.pickup_address,
    pw.pickup_status,
    db.name,
    db.district_address,
    wt.waste_type_name
ORDER BY 
    pw.pickup_date DESC;