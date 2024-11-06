DELIMITER //

CREATE TRIGGER tr_update_dropbox_capacity
AFTER UPDATE ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE new_capacity INT;
    
    -- Periksa jika status berubah menjadi 'completed'
    IF NEW.pickup_status = 'completed' AND OLD.pickup_status <> 'completed' THEN
        -- Ambil kapasitas terbaru dari dropbox terkait dan tambahkan 1
        SELECT capacity + 1 INTO new_capacity
        FROM dropbox
        WHERE dropbox_id = NEW.dropbox_id;
        
        -- Perbarui kapasitas dan status pada tabel dropbox
        IF new_capacity >= 100 THEN
            UPDATE dropbox
            SET capacity = 100, status = 'Full'
            WHERE dropbox_id = NEW.dropbox_id;
        ELSE
            UPDATE dropbox
            SET capacity = new_capacity -- , status = 'Available'
            WHERE dropbox_id = NEW.dropbox_id;
        END IF;
    END IF;
END //

DELIMITER ;
