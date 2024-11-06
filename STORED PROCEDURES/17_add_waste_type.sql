DELIMITER //

DROP PROCEDURE IF EXISTS add_waste_type //

CREATE PROCEDURE add_waste_type (
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
    INSERT INTO waste_type (waste_type_name, image)
    VALUES (p_waste_type_name, p_image);
    SELECT 'Waste type added successfully.' AS result_message;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL add_waste_type(
    'IT Equipment',
    'it_equipment_image.jpg'
);
