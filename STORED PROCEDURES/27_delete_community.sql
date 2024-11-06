DELIMITER //

DROP PROCEDURE IF EXISTS delete_community //

CREATE PROCEDURE delete_community (
    IN p_community_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel community
    SELECT COUNT(*) INTO id_exists
    FROM community
    WHERE community_id = p_community_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data community berdasarkan ID
        DELETE FROM community
        WHERE community_id = p_community_id;

    ALTER TABLE community AUTO_INCREMENT = 1;

        -- Tampilkan pesan sukses
        SELECT 'Community member deleted successfully.' AS result_message;
    END IF;
END //

DELIMITER ;
