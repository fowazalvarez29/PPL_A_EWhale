DELIMITER //

DROP PROCEDURE IF EXISTS add_dropbox //

CREATE PROCEDURE add_dropbox (
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(255),
    IN p_district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat'),
    IN p_longitude DECIMAL(11,8),
    IN p_latitude DECIMAL(11,8),
    IN p_capacity INT
)
BEGIN
    DECLARE name_exists INT;
    DECLARE address_exists INT;

    -- Cek jika nama dropbox sudah ada
    SELECT COUNT(*) INTO name_exists
    FROM dropbox
    WHERE name = p_name;
    
    IF name_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox name is already registered';
    END IF;

    -- Cek jika alamat dropbox sudah ada
    SELECT COUNT(*) INTO address_exists
    FROM dropbox
    WHERE address = p_address;

    IF address_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox address is already registered';
    END IF;

    -- Pastikan kapasitas antara 0-100, jika tidak atur ke default 0
    IF p_capacity < 0 OR p_capacity > 100 THEN
        SET p_capacity = 0;
    END IF;

    -- Insert data dropbox baru jika semua pemeriksaan lolos
    INSERT INTO dropbox (
        name, address, district_address, longitude, latitude, capacity, status, created_at, updated_at
    ) VALUES (
        p_name, p_address, p_district_address, p_longitude, p_latitude, p_capacity,
        'Available', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END //

DELIMITER ;



-- Contoh pemanggilan
CALL add_dropbox (
    'Dropbox Cimahi',       -- name
    'Jl. Baros nomor 20',   -- address
    'Cimahi',               -- district
    NULL,                   -- longtitude
    NULL,                   -- latitude
    0                       -- capacity
);

