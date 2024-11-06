CREATE OR REPLACE VIEW view_dropbox_status AS
SELECT 
    dropbox_id,
    name AS dropbox_name,
    address,
    district_address,
    capacity,
    status,
    CASE 
        WHEN capacity >= 100 THEN 'Full'
        -- WHEN capacity >= 75 THEN 'Almost Full'
        ELSE 'Available'
    END AS capacity_status,
    created_at,
    updated_at
FROM dropbox;
