DELIMITER //

DROP TRIGGER IF EXISTS tr_set_status_insert_dropbox //

CREATE TRIGGER tr_set_status_insert_dropbox
BEFORE INSERT ON dropbox
FOR EACH ROW
BEGIN
    IF NEW.capacity >= 100 THEN
        SET NEW.status = 'Full';
    ELSE
        SET NEW.status = 'Available';
    END IF;
END //

DELIMITER ;
