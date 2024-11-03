DELIMITER //

CREATE PROCEDURE reset_auto_increment()
BEGIN
    START TRANSACTION;

    ALTER TABLE courier AUTO_INCREMENT = 1;
    ALTER TABLE community AUTO_INCREMENT = 1;
    ALTER TABLE dropbox AUTO_INCREMENT = 1;
    ALTER TABLE management AUTO_INCREMENT = 1;
    ALTER TABLE waste_type AUTO_INCREMENT = 1;
    ALTER TABLE waste AUTO_INCREMENT = 1;
    ALTER TABLE pickup_waste AUTO_INCREMENT = 1;
    ALTER TABLE pickup_detail AUTO_INCREMENT = 1;
    ALTER TABLE courier_points AUTO_INCREMENT = 1;
    ALTER TABLE community_points AUTO_INCREMENT = 1;

    COMMIT;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL reset_auto_increment();