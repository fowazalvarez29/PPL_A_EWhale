DELIMITER //

CREATE FUNCTION funct_check_dropbox_status(p_dropbox_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(50);

    -- Ambil status dari tabel dropbox berdasarkan dropbox_id
    SELECT status INTO status
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    RETURN status;
END //

DELIMITER ;