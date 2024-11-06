DELIMITER //

DROP PROCEDURE IF EXISTS update_dropbox //

CREATE PROCEDURE update_dropbox (
    IN p_dropbox_id INT,
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(255),
    IN p_district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat'),
    IN p_longitude DECIMAL(11, 8),
    IN p_latitude DECIMAL(11, 8),
    IN p_capacity INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM dropbox WHERE dropbox_id = p_dropbox_id) THEN
        IF p_capacity <= 150 THEN
            UPDATE dropbox
            SET name = p_name,
                address = p_address,
                district_address = p_district_address,
                longitude = p_longitude,
                latitude = p_latitude,
                capacity = p_capacity,
                status = CASE WHEN p_capacity >= 100 THEN 'Full' ELSE 'Available' END
            WHERE dropbox_id = p_dropbox_id;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Capacity cannot exceed 150';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox not found';
    END IF;
END //

DELIMITER ;

-- Contoh Pemanggilan
CALL update_dropbox (
    6,
    'Dropbox Cimahi Baros',         -- name
    'Jl. Baros nomor 20',           -- address
    'Cimahi',                       -- district
    NULL,                           -- longtitude
    NULL,                           -- latitude
    100                             -- capacity
)