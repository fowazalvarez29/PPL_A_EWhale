DELIMITER //

CREATE PROCEDURE add_pickup_waste(
    IN p_pickup_date DATE,
    IN p_pickup_address VARCHAR(255),
    IN p_district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat'),
    IN p_dropbox_id INT,
    IN p_courier_id INT,
    IN p_community_id INT
)
BEGIN
    DECLARE dropbox_capacity INT;
    DECLARE courier_verified TINYINT(1);
    DECLARE community_verified TINYINT(1);


    -- 1. Check apakah drop box full?
    SELECT capacity INTO dropbox_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_capacity >= 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Drop box is full!';
    END IF;

    -- 2. Verifikasi kurir apakah verified?
    SELECT is_verified INTO courier_verified
    FROM courier
    WHERE courier_id = p_courier_id AND is_active = 1;

    IF courier_verified = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Courier is not verified or inactive!';
    END IF;

    -- 3. Verifikasi community apakah verified?
    SELECT is_verified INTO community_verified
    FROM community
    WHERE community_id = p_community_id;

    IF community_verified = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Community is not verified!';
    END IF;

    -- 4. Insert data into pickup_waste jika semua kondisi terpenuhi
    INSERT INTO pickup_waste (pickup_date, pickup_address, district_address, dropbox_id, courier_id, community_id, pickup_status)
    VALUES (p_pickup_date, p_pickup_address, p_district_address, p_dropbox_id, p_courier_id, p_community_id, 'pending');

END //

DELIMITER ;


-- Contoh pemanggilan
CALL add_pickup_waste(
    '2024-11-10',           -- pickup_date
    'Jalan Merdeka No.10',   -- pickup_address
    'Bandung Utara',         -- district_address
    1,                       -- dropbox_id (id yang terverifikasi)
    2,                       -- courier_id (id yang terverifikasi)
    3                        -- community_id (id yang terverifikasi)
);
