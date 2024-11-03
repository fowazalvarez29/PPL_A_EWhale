DELIMITER //

CREATE FUNCTION is_courier_verified(courierId INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE verified TINYINT;

    -- Pastikan query hanya mengembalikan satu baris
    SELECT is_verified INTO verified
    FROM courier
    WHERE courier_id = courierId
    LIMIT 1;

    -- Kembalikan TRUE jika courier terverifikasi
    RETURN (verified = 1);
END //

DELIMITER ;
