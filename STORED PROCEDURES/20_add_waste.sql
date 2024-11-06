DELIMITER //

DROP PROCEDURE IF EXISTS add_waste //

CREATE PROCEDURE add_waste (
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    INSERT INTO waste (waste_name, point, waste_type_id, image, description)
    VALUES (p_waste_name, p_point, p_waste_type_id, p_image, p_description);
    SELECT 'Waste item added successfully.' AS result_message;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL add_waste(
    'Electronic Device',
    50,
    1,
    'device_image.jpg',
    'A description for the electronic device'
);
