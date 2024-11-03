CREATE VIEW vw_management_profile AS
SELECT 
    m.management_id,
    m.name AS management_name,
    m.email,
    m.phone,
    m.date_of_birth,
    m.address,
    m.photo,
    CASE 
        WHEN m.is_active = 1 THEN 'YES' 
        ELSE 'NO' 
    END AS is_active,
    CASE 
        WHEN m.is_admin = 1 THEN 'YES' 
        ELSE 'NO' 
    END AS is_admin,
    m.created_at,
    m.updated_at
FROM 
    management m;
