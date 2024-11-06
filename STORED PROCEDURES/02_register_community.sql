DELIMITER //

DROP PROCEDURE IF EXISTS register_community //

CREATE PROCEDURE register_community (
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE pass_valid TINYINT(1);
    
    -- Validasi Email
    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Validasi Nomor Telepon
    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM community WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    INSERT INTO community (
        name, email, password, phone, date_of_birth, address,
        photo, is_verified, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_photo, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;

-- Contoh pemanggilan
CALL register_community(
    'Jane Doe',                 -- p_name
    'janedoe@email.com',        -- p_email
    'securepassword',           -- p_password
    '081234567891',             -- p_phone
    '1995-08-22',               -- p_date_of_birth
    'Jl. Merdeka No. 2',        -- p_address
    NULL                        -- p_photo
);
