CREATE OR REPLACE VIEW vw_pickup_tracking AS
SELECT 
    pw.pickup_id,
    c.name AS community_name,
    co.name AS courier_name,
    pw.pickup_date,
    pw.pickup_address,
    pw.pickup_status,
    d.name AS dropbox_name,
    pw.created_at AS request_date,
    pw.updated_at AS last_updated
FROM pickup_waste pw
JOIN community c ON pw.community_id = c.community_id
LEFT JOIN courier co ON pw.courier_id = co.courier_id
LEFT JOIN dropbox d ON pw.dropbox_id = d.dropbox_id;
