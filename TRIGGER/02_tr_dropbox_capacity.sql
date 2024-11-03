DELIMITER //

CREATE TRIGGER tr_dropbox_capacity
AFTER INSERT ON pickup_detail
FOR EACH ROW
BEGIN
    DECLARE new_capacity INT;

    -- Mengambil kapasitas terbaru dari dropbox yang terkait
    SELECT capacity + NEW.quantity INTO new_capacity
    FROM dropbox
    WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);

    -- Memperbarui kapasitas dan status pada tabel dropbox
    IF new_capacity >= 100 THEN
        UPDATE dropbox
        SET capacity = 100, status = 'Full'
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    ELSE
        UPDATE dropbox
        SET capacity = new_capacity
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    END IF;
END //

DELIMITER ;