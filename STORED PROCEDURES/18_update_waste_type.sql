DELIMITER //

DROP PROCEDURE IF EXISTS update_waste_type //

CREATE PROCEDURE update_waste_type (
    IN p_waste_type_id INT,
    IN p_waste_type_name ENUM(
        'Large Household Appliance', 
        'Small Household Appliances',
        'IT Equipment', 
        'Lamps', 
        'Toys', 
        'Screens and Monitors', 
        'Other Electronic Devices'),
    IN p_image VARCHAR(255)
)
BEGIN
    DECLARE waste_type_exists INT;

    -- Cek apakah waste_type_id ada
    SELECT COUNT(*) INTO waste_type_exists
    FROM waste_type
    WHERE waste_type_id = p_waste_type_id;

    IF waste_type_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        UPDATE waste_type
        SET waste_type_name = p_waste_type_name,
            image = p_image
        WHERE waste_type_id = p_waste_type_id;
        SELECT 'Waste type updated successfully.' AS result_message;
    END IF;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL update_waste_type(
    1,
    'Updated Waste Type',
    'updated_image.jpg'
);
