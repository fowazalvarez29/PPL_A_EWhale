DELIMITER //

DROP PROCEDURE IF EXISTS approve_courier_registration //

CREATE PROCEDURE approve_courier_registration (
    IN p_courier_id INT,
    IN p_approve ENUM('Pending', 'Approved', 'Reject')
)
BEGIN
    DECLARE is_files_complete BOOLEAN;

    -- Periksa kelengkapan berkas, yaitu NIK, ktp_url, dan kk_url harus tidak NULL
    SET is_files_complete = (SELECT 
        CASE 
            WHEN nik IS NOT NULL AND ktp_url IS NOT NULL AND kk_url IS NOT NULL THEN TRUE 
            ELSE FALSE 
        END
    FROM courier
    WHERE courier_id = p_courier_id);

    -- Jika berkas lengkap, lanjutkan dengan update status
    IF is_files_complete THEN
        UPDATE courier
        SET status = p_approve,
            is_verified = IF(p_approve = 'Approved', 1, 0)
        WHERE courier_id = p_courier_id;
        
        -- Kembalikan pesan sukses
        SELECT CASE 
            WHEN p_approve = 'Approved' THEN 'Courier registration approved successfully.'
            WHEN p_approve = 'Reject' THEN 'Courier registration rejected.'
            ELSE 'Courier registration set to pending.'
        END AS result_message;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Courier documents are incomplete. Please check NIK, KTP URL, and KK URL.';
    END IF;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL approve_courier_registration(
    2,
    'Approved'
)