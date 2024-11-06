CREATE OR REPLACE VIEW vw_pickup_waste AS
SELECT 
    pw.pickup_id,
    pw.pickup_address,
    pw.pickup_status,
    pw.pickup_date,
    cm.community_id,
    cm.name,
    cm.address,
    GROUP_CONCAT(DISTINCT w.waste_id) AS waste_id,
	GROUP_CONCAT(DISTINCT w.waste_name) AS waste_names,
    GROUP_CONCAT(DISTINCT w.image) AS waste_image,
    GROUP_CONCAT(DISTINCT w.description) AS waste_description,
    GROUP_CONCAT(DISTINCT wt.waste_type_id) AS waste_type_id,
    GROUP_CONCAT(DISTINCT wt.waste_type_name) AS waste_type_names,
    GROUP_CONCAT(DISTINCT wt.image) AS waste_type_images
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
JOIN 
    community cm ON pw.community_id = cm.community_id
GROUP BY 
    pw.pickup_id, 
    pw.pickup_date, 
    pw.pickup_address, 
    pw.pickup_status, 
    db.name, 
    db.district_address
ORDER BY 
    pw.pickup_date DESC;
