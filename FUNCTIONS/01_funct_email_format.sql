DELIMITER //

CREATE FUNCTION funct_email_format(email_input VARCHAR(255))
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    -- Memeriksa format email.
    -- Memastikan ada teks sebelum '@', diikuti oleh domain, dan ekstensi
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF email_input REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END //

DELIMITER ;

-- Contoh penggunaan func_email_format
SELECT func_email_format('example@test.com');  -- Output: 1
SELECT func_email_format('invalid-email');     -- Output: 0