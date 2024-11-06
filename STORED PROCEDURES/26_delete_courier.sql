DELIMITER //

DROP PROCEDURE IF EXISTS delete_courier //

CREATE PROCEDURE delete_courier (
    IN p_courier_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel courier
    SELECT COUNT(*) INTO id_exists
    FROM courier
    WHERE courier_id = p_courier_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data courier berdasarkan ID
        DELETE FROM courier
        WHERE courier_id = p_courier_id;

    ALTER TABLE courier AUTO_INCREMENT = 1;

        -- Tampilkan pesan sukses
        SELECT 'Courier deleted successfully.' AS result_message;
    END IF;
END //

DELIMITER ;
