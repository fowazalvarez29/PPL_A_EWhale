DELIMITER //

CREATE TRIGGER tr_pickup_dropbox
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE dropbox_status VARCHAR(50);

    -- Cek status dropbox dengan menggunakan function check_dropbox_status
    SET dropbox_status = check_dropbox_status(NEW.dropbox_id);

    -- Jika status dropbox adalah 'Drop box is Full!', maka batalkan proses insert
    IF dropbox_status = 'Drop box is Full!' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Drop box is Full!';
    END IF;
END //

DELIMITER ;
