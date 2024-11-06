DELIMITER //

DROP PROCEDURE IF EXISTS delete_dropbox //

CREATE PROCEDURE delete_dropbox (
    IN p_dropbox_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM dropbox WHERE dropbox_id = p_dropbox_id) THEN
        DELETE FROM dropbox WHERE dropbox_id = p_dropbox_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox not found';
    END IF;

    ALTER TABLE dropbox AUTO_INCREMENT = 1;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL delete_dropbox (
    6
)