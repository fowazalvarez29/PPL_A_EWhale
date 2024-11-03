CREATE VIEW vw_community_profile AS
SELECT 
    cm.community_id,
    cm.name AS community_name,
    cm.email,
    cm.phone,
    cm.date_of_birth,
    cm.address,
    cm.photo,
    cm.is_verified,
    IFNULL(cp.total_points, 0) AS total_points_collected, -- Total poin yang dikumpulkan
    cm.created_at,
    cm.updated_at
FROM 
    community cm
LEFT JOIN 
    community_points cp ON cm.community_id = cp.community_id;
