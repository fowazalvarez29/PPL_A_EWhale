DELIMITER //

CREATE OR REPLACE FUNCTION is_courier_verified_and_active(courierId INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE verified TINYINT;

    -- Pastikan query hanya mengembalikan satu baris
    SELECT is_verified INTO verified
    FROM courier
    WHERE courier_id = courierId
    LIMIT 1;

    -- Kembalikan TRUE jika courier terverifikasi dan aktif
    RETURN (verified = 1);
END //

DELIMITER ;
