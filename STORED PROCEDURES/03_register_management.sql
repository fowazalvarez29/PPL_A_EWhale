DELIMITER //

CREATE PROCEDURE 03_register_management(
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
    FROM management
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Check if phone number already exists
    -- SELECT COUNT(*) INTO phone_exists
    -- FROM management
    -- WHERE phone = p_phone;

    -- IF phone_exists > 0 THEN
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    -- END IF;

    -- Insert new management record if all checks pass
    -- Masukkan data ke tabel management
        INSERT INTO management (
            name, email, password, date_of_birth, address, phone, photo)
        VALUES (
            p_name, p_email, p_password, p_date_of_birth, p_address, p_phone, p_photo);
    
END //

DELIMITER ;

-- Contoh pemanggilan
CALL register_management(
    'John Doe',
    'johndoe@example.com',
    'securepassword',
    '1985-05-12',
    '123 Main St',
    '081234567890',
    'path/to/photo.jpg'
);
