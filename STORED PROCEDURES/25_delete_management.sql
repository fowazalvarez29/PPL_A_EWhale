DELIMITER //

DROP PROCEDURE IF EXISTS delete_management //

CREATE PROCEDURE delete_management (
    IN p_management_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel management
    SELECT COUNT(*) INTO id_exists
    FROM management
    WHERE management_id = p_management_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data management berdasarkan ID
        DELETE FROM management
        WHERE management_id = p_management_id;

    ALTER TABLE management AUTO_INCREMENT = 1;

        -- Tampilkan pesan sukses
        SELECT 'Management user deleted successfully.' AS result_message;
    END IF;
END //

DELIMITER ;
