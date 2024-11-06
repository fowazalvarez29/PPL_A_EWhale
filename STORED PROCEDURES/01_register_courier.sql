DELIMITER //

DROP PROCEDURE IF EXISTS register_courier //

CREATE PROCEDURE register_courier (
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_nik VARCHAR(255),
    IN p_account_number VARCHAR(50),
    IN p_ktp_url VARCHAR(255),
    IN p_kk_url VARCHAR(255),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE pass_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT;

    -- Validasi Email
    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
    END IF;

    -- Validasi Nomor Telepon
    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM courier WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    SELECT COUNT(*) INTO phone_exists FROM courier WHERE phone = p_phone;
    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    END IF;

    INSERT INTO courier (
        name, email, password, phone, date_of_birth, address,
        nik, account_number, ktp_url, kk_url, photo, is_verified, status,
        created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_nik, p_account_number, p_ktp_url, p_kk_url, p_photo, 0, 'pending',
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;

-- Contoh pemanggilan
-- Contoh pemanggilan
CALL register_courier(
    'Fowaz Amran',                  -- p_name
    'fowazamran@email.com',         -- p_email
    'password!1A',                  -- p_password
    '081234567880',                 -- p_phone
    '1998-05-15',                   -- p_date_of_birth
    'Jl. Bougenville VII No. 19',   -- p_address
    '1234567890133456',             -- p_nik
    '1234567890',                   -- p_account_number
    NULL,                           -- p_ktp_url
    NULL,                           -- p_kk_url
    NULL                            -- p_photo
);
