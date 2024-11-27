DELIMITER //

DROP TRIGGER IF EXISTS tr_dropbox_capacity //

CREATE TRIGGER tr_dropbox_capacity
BEFORE UPDATE ON dropbox
FOR EACH ROW
BEGIN
    -- Jika kapasitas kurang dari 100, set status menjadi 'Available'
    IF NEW.capacity < 100 THEN
        SET NEW.status = 'Available';
    ELSE
        SET NEW.status = 'Full';
    END IF;
END //

DELIMITER ;