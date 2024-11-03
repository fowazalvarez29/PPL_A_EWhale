DELIMITER //

CREATE PROCEDURE register_community (
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(50),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT;

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
    FROM community
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Check if phone number already exists
    SELECT COUNT(*) INTO phone_exists
    FROM community
    WHERE phone = p_phone;

    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    END IF;

    -- Insert new community if all checks pass
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
    'Amran', -- name
    'amran@example.com', -- email (unique)
    'securepassword', -- password
    '081234567891', -- phone
    '1990-08-20', -- date of birth
    '456 Maple Ave, City', -- address
    'http://example.com/photo.jpg' -- photo (boleh null)
);
