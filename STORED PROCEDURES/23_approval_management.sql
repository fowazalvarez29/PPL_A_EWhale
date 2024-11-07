DELIMITER //

DROP PROCEDURE IF EXISTS approval_management //

CREATE PROCEDURE approval_management (
    IN p_management_id INT
)
BEGIN
    -- Validasi jika management_id ada
    DECLARE id_exists INT;

    SELECT COUNT(*) INTO id_exists
    FROM management
    WHERE management_id = p_management_id;

    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Update status is_verified menjadi 1 untuk approval
        UPDATE management
        SET is_verified = 1
        WHERE management_id = p_management_id;

        -- Tampilkan pesan sukses
        SELECT 'Management user approved successfully.' AS result_message;
    END IF;
END //

DELIMITER ;
