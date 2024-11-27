DELIMITER //

DROP TRIGGER IF EXISTS validate_and_approve_courier //

CREATE TRIGGER validate_and_approve_courier
BEFORE UPDATE ON courier
FOR EACH ROW
BEGIN
    -- Periksa apakah is_verified diset menjadi 1
    IF NEW.is_verified = 1 THEN
        -- Periksa apakah nik, ktp_url, atau kk_url masih kosong
        IF NEW.nik IS NULL OR NEW.nik = '' 
           OR NEW.ktp_url IS NULL OR NEW.ktp_url = '' 
           OR NEW.kk_url IS NULL OR NEW.kk_url = '' THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Cannot set is_verified to TRUE: NIK, KTP, and KK must not be empty.';
        ELSE
            -- Jika semua validasi terpenuhi, ubah status menjadi 'Approved'
            SET NEW.status = 'Approved';
        END IF;
    END IF;

    -- Periksa jika is_verified diset menjadi 0
    IF NEW.is_verified = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot set is_verified to FALSE once it has been verified.';
    END IF;

    -- Periksa jika status diubah menjadi 'Approved'
    IF NEW.status = 'Approved' THEN
        -- Pastikan semua data valid sebelum diset ke Approved
        IF NEW.nik IS NULL OR NEW.nik = '' 
           OR NEW.ktp_url IS NULL OR NEW.ktp_url = '' 
           OR NEW.kk_url IS NULL OR NEW.kk_url = '' THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Cannot set status to Approved: NIK, KTP, and KK must not be empty.';
        END IF;
    END IF;
END //

DELIMITER ;
