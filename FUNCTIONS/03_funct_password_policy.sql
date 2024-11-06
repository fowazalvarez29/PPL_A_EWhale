DELIMITER //

DROP FUNCTION IF EXISTS funct_password_policy //

CREATE FUNCTION funct_password_policy(password VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE isValid INT DEFAULT 1;

    -- Cek panjang minimal 8 karakter
    IF LENGTH(password) < 8 THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan huruf kapital
    IF password NOT REGEXP '[A-Z]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan huruf kecil
    IF password NOT REGEXP '[a-z]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan angka
    IF password NOT REGEXP '[0-9]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan karakter spesial
    IF password NOT REGEXP '[^a-zA-Z0-9]' THEN
        SET isValid = 0;
    END IF;

    RETURN isValid;
END //

DELIMITER ;
