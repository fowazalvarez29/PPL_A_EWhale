-- HARUS JALANKAN FUNCTIONS 03 TERLEBIH DAHULU!!!

DELIMITER //

CREATE TRIGGER tr_pickup_dropbox
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE dropbox_status VARCHAR(50);

    -- Mengambil status dropbox menggunakan fungsi check_dropbox_status
    SET dropbox_status = 03_funct_check_dropbox_status(NEW.dropbox_id);

    -- Jika status dropbox adalah 'Full', batalkan operasi INSERT dengan pesan error
    IF dropbox_status = 'Full' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Drop box is Full!';
    END IF;
END //

DELIMITER ;