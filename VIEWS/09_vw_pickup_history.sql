CREATE VIEW vw_pickup_history AS
SELECT 
    pw.pickup_id,
    pw.pickup_date,
    pw.pickup_address,
    pw.district_address,
    pw.pickup_status,
    d.name AS dropbox_name,
    c.name AS courier_name,
    cm.name AS community_name
FROM 
    pickup_waste pw
LEFT JOIN 
    dropbox d ON pw.dropbox_id = d.dropbox_id
LEFT JOIN 
    courier c ON pw.courier_id = c.courier_id
LEFT JOIN 
    community cm ON pw.community_id = cm.community_id;