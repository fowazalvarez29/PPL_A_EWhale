DELIMITER //

DROP PROCEDURE IF EXISTS update_dropbox_capacity //

CREATE PROCEDURE update_dropbox_capacity(
    IN p_dropbox_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE new_capacity INT;
    
    -- Ambil kapasitas saat ini dari dropbox
    SELECT capacity INTO new_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;
    
    -- Tambahkan atau kurangi kapasitas berdasarkan p_quantity
    SET new_capacity = new_capacity + p_quantity;
    
    -- Pastikan kapasitas tidak melebihi batas maksimum (100) atau kurang dari 0
    IF new_capacity > 100 THEN
        SET new_capacity = 100;
    ELSEIF new_capacity < 0 THEN
        SET new_capacity = 0;
    END IF;

    -- Perbarui kapasitas pada dropbox
    UPDATE dropbox
    SET capacity = new_capacity
    WHERE dropbox_id = p_dropbox_id;
    
    -- Perbarui status sesuai dengan kapasitas baru
    IF new_capacity >= 100 THEN
        UPDATE dropbox
        SET status = 'Full'
        WHERE dropbox_id = p_dropbox_id;
    ELSE
        UPDATE dropbox
        SET status = 'Available'
        WHERE dropbox_id = p_dropbox_id;
    END IF;
    
    -- Tampilkan pesan berhasil
    SELECT CONCAT('Dropbox capacity updated to ', new_capacity, ' and status set to ', 
                  IF(new_capacity >= 100, 'Full', 'Available')) AS result_message;
END //

DELIMITER ;
