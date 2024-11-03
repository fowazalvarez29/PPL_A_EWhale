DELIMITER //

CREATE FUNCTION check_dropbox_capacity(pickup_id INT, quantity INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE current_capacity INT;
    DECLARE current_status ENUM('Full', 'Available');
    DECLARE dropbox_id INT;

    -- Mendapatkan dropbox_id dari pickup_waste
    SELECT dropbox_id INTO dropbox_id
    FROM pickup_waste
    WHERE pickup_id = pickup_id;

    -- Jika dropbox_id tidak ditemukan, kembalikan FALSE
    IF dropbox_id IS NULL THEN
        RETURN FALSE;
    END IF;

    -- Mendapatkan kapasitas dan status dropbox
    SELECT capacity, status INTO current_capacity, current_status
    FROM dropbox
    WHERE dropbox_id = dropbox_id;

    -- Jika dropbox penuh atau kapasitas tidak cukup, kembalikan FALSE
    IF current_status = 'Full' OR current_capacity + quantity > 1000 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END //

DELIMITER ;
