DELIMITER //

CREATE FUNCTION funct_phone(phone_input VARCHAR(15))
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    -- Memastikan input hanya terdiri dari angka 0-9
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF phone_input REGEXP '^[0-9]+$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END //

DELIMITER ;

-- Contoh penggunaan func_phone
SELECT func_phone('081234567890');             -- Output: 1
SELECT func_phone('0812-345-678');             -- Output: 0