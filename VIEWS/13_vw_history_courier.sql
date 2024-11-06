CREATE OR REPLACE VIEW vw_history_courier AS
SELECT 
    pw.pickup_id AS pickup_id,
    pw.pickup_date AS pickup_date,
    pw.pickup_address AS pickup_address,
    pw.pickup_status AS pickup_status,
    db.name AS "Drop Box Name",
    db.district_address AS district_address,
    GROUP_CONCAT(DISTINCT wt.waste_type_name) AS waste_type_names,
    GROUP_CONCAT(DISTINCT w.waste_name) AS waste_name,
    GROUP_CONCAT(DISTINCT pd.quantity) AS total_quantity,
    GROUP_CONCAT(DISTINCT pd.points) AS total_points
FROM 
    pickup_detail pd
JOIN 
    pickup_waste pw ON pd.pickup_id = pw.pickup_id
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
    db.district_address
ORDER BY 
    pw.pickup_date DESC;
