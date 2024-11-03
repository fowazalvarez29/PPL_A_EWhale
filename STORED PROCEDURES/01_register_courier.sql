DELIMITER //

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
    DECLARE phone_valid TINYINT(1);
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
CALL register_courier(
    'John Doe',                -- p_name
    'johndoe@email.com',       -- p_email
    'securepassword',          -- p_password
    '081234567890',            -- p_phone
    '1990-05-15',              -- p_date_of_birth
    'Jl. Kebon Jeruk No. 1',   -- p_address
    '1234567890123456',        -- p_nik
    '1234567890',              -- p_account_number
    NULL,                      -- p_ktp_url
    NULL,                      -- p_kk_url
    NULL                       -- p_photo
);
