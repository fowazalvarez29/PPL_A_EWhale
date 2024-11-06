DELIMITER //

DROP PROCEDURE IF EXISTS manage_waste_type //

CREATE PROCEDURE manage_waste_type (
    IN p_action ENUM('add', 'update', 'delete'),
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
    CASE p_action
        WHEN 'add' THEN
            INSERT INTO waste_type (waste_type_name, image)
            VALUES (p_waste_type_name, p_image);
            SELECT 'Waste type added successfully.' AS result_message;

        WHEN 'update' THEN
            UPDATE waste_type
            SET waste_type_name = p_waste_type_name,
                image = p_image
            WHERE waste_type_id = p_waste_type_id;
            SELECT 'Waste type updated successfully.' AS result_message;

        WHEN 'delete' THEN
            DELETE FROM waste_type
            WHERE waste_type_id = p_waste_type_id;
            SELECT 'Waste type deleted successfully.' AS result_message;
            ALTER TABLE waste_type AUTO_INCREMENT = 1;

        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid action.';
    END CASE;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL manage_waste_type('ADD', NULL, 'Small Household Appliances', 'http://example.com/image.jpg');

CALL manage_waste_type('UPDATE', 8, 'Small Household Appliances', 'http://example.com/newimage.jpg');

CALL manage_waste_type('DELETE', 3, NULL, NULL);
