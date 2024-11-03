DELIMITER //

CREATE PROCEDURE 04_register_dropbox (
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(50),
    IN p_longitude VARCHAR(255),
    IN p_latitude VARCHAR(255),
    IN p_capacity INT
)
BEGIN
    DECLARE name_exists INT;
    DECLARE address_exists INT;

    -- Check if dropbox name already exists
    SELECT COUNT(*) INTO name_exists
    FROM dropbox
    WHERE name = p_name;
    
    IF name_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox name is already registered';
    END IF;

    -- Check if dropbox address already exists
    SELECT COUNT(*) INTO address_exists
    FROM dropbox
    WHERE address = p_address;

    IF address_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox address is already registered';
    END IF;

    -- Insert new dropbox record if all checks pass
    INSERT INTO dropbox (
        name, address, longitude, latitude, capacity, status, created_at, updated_at
    ) VALUES (
        p_name, p_address, p_longitude, p_latitude, 
        IF(p_capacity BETWEEN 0 AND 1000, p_capacity, 0), -- Ensure capacity is within 0-1000
        'Available', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;

-- Contoh pemanggilan
CALL register_dropbox(
    'Dropbox A', -- name dropbox
    'Jl. Merdeka No. 123', -- address
    '-6.200000', -- longtitude (boleh null)
    '106.816666', -- latitude (boleh null)
    500 -- (boleh null karena default 0)
);
