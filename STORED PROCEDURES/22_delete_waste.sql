DELIMITER //

DROP PROCEDURE IF EXISTS delete_waste //

CREATE PROCEDURE delete_waste (
    IN p_waste_id INT
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
        DELETE FROM waste
        WHERE waste_id = p_waste_id;
        SELECT 'Waste item deleted successfully.' AS result_message;
        ALTER TABLE waste AUTO_INCREMENT = 1;
    END IF;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL delete_waste(8);
