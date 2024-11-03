DELIMITER //

CREATE PROCEDURE 01_register_courier (
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
    -- DECLARE phone_exists INT;

    -- Check email format
    SET email_valid = func_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Check phone format
    SET phone_valid = func_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Check if email already exists
    SELECT COUNT(*) INTO email_exists
    FROM courier
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Check if phone number already exists
    -- SELECT COUNT(*) INTO phone_exists
    -- FROM courier
    -- WHERE phone = p_phone;

    -- IF phone_exists > 0 THEN
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    -- END IF;

    -- Insert new courier if all checks pass
    INSERT INTO courier (
        name, email, password, phone, date_of_birth, address,
        nik, account_number, ktp_url, kk_url, photo, is_verified, is_active,
        created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_nik, p_account_number, p_ktp_url, p_kk_url, p_photo, 0, 1,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;

-- Contoh pemanggilan
CALL register_courier(
    'Fowaz', -- name
    'fowaz@example.com', -- email (unique)
    'password123', -- password
    '081234567890', -- phone
    '1985-05-15', -- date of birth
    '123 Main St, City', -- address
    '1111111111111111', -- NIK (unique)
    '0123456789', -- account number
    'http://example.com/ktp.jpg', -- ktp (boleh null)
    'http://example.com/kk.jpg', -- kk (boleh null)
    'http://example.com/photo.jpg' -- photo (boleh null) 
);

