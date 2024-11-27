DELIMITER //

DROP TRIGGER IF EXISTS tr_check_dropbox_capacity //

DELIMITER //

CREATE TRIGGER tr_check_dropbox_capacity
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE dropbox_status ENUM('Full', 'Available');

    -- Mendapatkan status dropbox terkait
    SELECT status INTO dropbox_status
    FROM dropbox
    WHERE dropbox_id = NEW.dropbox_id;

    -- Jika status dropbox adalah 'Full', batalkan operasi
    IF dropbox_status = 'Full' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add pickup request: Dropbox is full.';
    END IF;
END //

DELIMITER ;
