DELIMITER //

DROP PROCEDURE IF EXISTS manage_waste //

CREATE PROCEDURE manage_waste (
    IN p_action ENUM('add', 'update', 'delete'),
    IN p_waste_id INT,
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    CASE p_action
        WHEN 'add' THEN
            INSERT INTO waste (waste_name, point, waste_type_id, image, description)
            VALUES (p_waste_name, p_point, p_waste_type_id, p_image, p_description);
            SELECT 'Waste item added successfully.' AS result_message;

        WHEN 'update' THEN
            UPDATE waste
            SET waste_name = p_waste_name,
                point = p_point,
                waste_type_id = p_waste_type_id,
                image = p_image,
                description = p_description
            WHERE waste_id = p_waste_id;
            SELECT 'Waste item updated successfully.' AS result_message;

        WHEN 'delete' THEN
            DELETE FROM waste
            WHERE waste_id = p_waste_id;
            SELECT 'Waste item deleted successfully.' AS result_message;
            ALTER TABLE waste AUTO_INCREMENT = 1;

        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid action.';
    END CASE;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL manage_waste('ADD', NULL, 'Used Smartphone', 50, 3, 'http://example.com/image.jpg', 'Small IT device');

CALL manage_waste('UPDATE', 8, 'Used Smartphone', 20, 3, 'Laptop yang tidak digunakan');

CALL manage_waste('DELETE', 8, NULL, NULL, NULL, NULL);
