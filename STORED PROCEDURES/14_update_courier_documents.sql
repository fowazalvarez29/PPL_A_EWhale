DELIMITER //

DROP PROCEDURE IF EXISTS update_courier_documents //

CREATE PROCEDURE update_courier_documents(
    IN p_courier_id INT,
    IN p_ktp_url VARCHAR(255),
    IN p_kk_url VARCHAR(255)
)
BEGIN
    DECLARE message VARCHAR(255);

    -- Periksa apakah courier_id ada dalam tabel
    IF EXISTS (SELECT 1 FROM courier WHERE courier_id = p_courier_id) THEN
        -- Update dokumen KTP dan KK
        UPDATE courier
        SET 
            ktp_url = p_ktp_url,
            kk_url = p_kk_url,
            status = 'Pending'  -- Set status menjadi Pending untuk validasi ulang
        WHERE 
            courier_id = p_courier_id;

        -- Pesan sukses
        SET message = 'Document has been successfully uploaded';
    ELSE
        -- Jika courier_id tidak ditemukan, kembalikan pesan error
        SET message = 'Courier ID not found!';
    END IF;

    -- Kembalikan pesan hasil
    SELECT message AS result_message;
END //

DELIMITER ;

-- Contoh pemanggilan
CALL update_courier_documents(
    1, 
    'https://ktp.com/new_ktp_url.jpg', 
    'https://kk.com/new_kk_url.jpg'
    );
