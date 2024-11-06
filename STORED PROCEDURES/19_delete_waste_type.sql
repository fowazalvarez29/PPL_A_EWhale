DELIMITER //

DROP PROCEDURE IF EXISTS delete_waste_type //

CREATE PROCEDURE delete_waste_type (
    IN p_waste_type_id INT
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
        DELETE FROM waste_type
        WHERE waste_type_id = p_waste_type_id;
        SELECT 'Waste type deleted successfully.' AS result_message;
        ALTER TABLE waste_type AUTO_INCREMENT = 1;
    END IF;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL delete_waste_type(1);
