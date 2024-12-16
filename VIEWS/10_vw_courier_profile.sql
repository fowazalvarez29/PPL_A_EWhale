CREATE OR REPLACE VIEW vw_courier_profile AS
SELECT 
    c.courier_id,
    c.name AS courier_name,
    c.email,
    c.phone,
    c.date_of_birth,
    c.address,
    c.account_number,
    c.nik,
    c.ktp_url,
    c.kk_url,
    c.photo,
    c.is_verified,
    c.status,
    c.created_at,
    c.updated_at
FROM 
    courier c
GROUP BY 
    c.courier_id, c.name, c.email, c.phone, c.date_of_birth, c.address, c.account_number,
    c.nik, c.ktp_url, c.kk_url, c.photo, c.is_verified, c.status, c.created_at, c.updated_at;
