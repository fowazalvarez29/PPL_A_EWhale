DELIMITER //

CREATE TRIGGER tr_pickup_dropbox
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE required_quantity INT DEFAULT 1;  -- Jumlah pickup, disesuaikan sesuai kebutuhan

    -- Cek kapasitas dropbox menggunakan fungsi check_dropbox_capacity
    IF check_dropbox_capacity(NEW.dropbox_id, required_quantity) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox is full!!';
    END IF;

    -- Jika kapasitas dropbox cukup, operasi `INSERT` akan berlanjut
END //

DELIMITER ;
