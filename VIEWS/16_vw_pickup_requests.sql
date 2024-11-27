CREATE OR REPLACE VIEW vw_pickup_requests AS
SELECT 
    pw.pickup_id,
    c.name AS community_name,
    pw.pickup_date,
    pw.pickup_address,
    pw.pickup_status,
    d.name AS dropbox_name,
    d.address AS dropbox_address
FROM pickup_waste pw
JOIN community c ON pw.community_id = c.community_id
LEFT JOIN dropbox d ON pw.dropbox_id = d.dropbox_id
WHERE pw.pickup_status = 'requested';
