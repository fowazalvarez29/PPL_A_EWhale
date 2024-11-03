CREATE OR REPLACE VIEW vw_top_10_couriers AS
SELECT 
    c.courier_id,
    c.name AS courier_name,
    COUNT(pw.pickup_id) AS total_pickups
FROM 
    courier c
JOIN 
    pickup_waste pw ON c.courier_id = pw.courier_id
GROUP BY 
    c.courier_id
ORDER BY 
    total_pickups DESC
LIMIT 10;
