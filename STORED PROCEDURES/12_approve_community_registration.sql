DELIMITER //

DROP PROCEDURE IF EXISTS approve_community_registration //

CREATE PROCEDURE approve_community_registration (
    IN p_community_id INT,
    IN p_approve TINYINT
)
BEGIN
    -- Jika p_approve = 1, set is_verified menjadi 1; jika p_approve = 0, set is_verified menjadi 0 (ditolak)
    UPDATE community
    SET is_verified = p_approve
    WHERE community_id = p_community_id;

    -- Kembalikan pesan sukses
    SELECT CASE 
        WHEN p_approve = 1 THEN 'Community registration approved successfully.'
        ELSE 'Community registration rejected.'
    END AS result_message;
END //

DELIMITER ;


-- Contoh pemanggilan
CALL approve_community_registration(
    2,
    1
)
