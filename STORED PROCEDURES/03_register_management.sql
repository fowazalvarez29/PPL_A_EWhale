DELIMITER //

DROP PROCEDURE IF EXISTS register_management //

CREATE PROCEDURE register_management (
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(50),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE pass_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT; 

    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM management WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    SELECT COUNT(*) INTO phone_exists FROM management WHERE phone = p_phone;
    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    END IF;

    INSERT INTO management (
        name, email, password, date_of_birth, address, phone, photo,
        is_active, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_date_of_birth, p_address, p_phone, p_photo,
        1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;

-- Contoh pemanggilan
CALL register_management(
    'Alice Smith',              -- p_name
    'alice.smith@email.com',    -- p_email
    'password123',              -- p_password
    '1985-10-30',               -- p_date_of_birth
    'Jl. Sudirman No. 3',       -- p_address
    '081234567892',             -- p_phone
    NULL                        -- p_photo
);

