DELIMITER //

DROP PROCEDURE IF EXISTS update_waste //

CREATE PROCEDURE update_waste (
    IN p_waste_id INT,
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    DECLARE waste_exists INT;

    -- Cek apakah waste_id ada
    SELECT COUNT(*) INTO waste_exists
    FROM waste
    WHERE waste_id = p_waste_id;

    IF waste_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        UPDATE waste
        SET waste_name = p_waste_name,
            point = p_point,
            waste_type_id = p_waste_type_id,
            image = p_image,
            description = p_description
        WHERE waste_id = p_waste_id;
        SELECT 'Waste item updated successfully.' AS result_message;
    END IF;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL update_waste(
    1,
    'Updated Device',
    60,
    1,
    'updated_device_image.jpg',
    'An updated description for the electronic device'
);
