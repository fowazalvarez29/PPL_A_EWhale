DELIMITER //

DROP TRIGGER IF EXISTS tr_validate_and_approve_courier //

CREATE TRIGGER tr_validate_and_approve_courier
BEFORE UPDATE ON courier
FOR EACH ROW
BEGIN
    -- Periksa apakah is_verified diset menjadi 1
    IF NEW.is_verified = 1 THEN
            SET NEW.status = 'Approved';
    END IF;

    -- Periksa apakah is_verified diset menjadi 0
    IF NEW.is_verified = 0 THEN
        -- Jika is_verified menjadi 0, ubah status menjadi 'Pending'
        SET NEW.status = 'Pending';
    END IF;

END //

DELIMITER ;
