CREATE OR REPLACE VIEW vw_accepted_pickups AS
SELECT 
    pw.pickup_id,
    c.name AS community_name,
    co.name AS courier_name,
    pw.pickup_date,
    pw.pickup_address,
    pw.pickup_status,
    d.name AS dropbox_name
FROM pickup_waste pw
JOIN community c ON pw.community_id = c.community_id
JOIN courier co ON pw.courier_id = co.courier_id
LEFT JOIN dropbox d ON pw.dropbox_id = d.dropbox_id
WHERE pw.pickup_status = 'accepted';
