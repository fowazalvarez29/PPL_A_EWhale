DELIMITER //

DROP PROCEDURE IF EXISTS add_pickup_waste //

CREATE PROCEDURE add_pickup_waste(
    IN p_pickup_date DATE,
    IN p_pickup_address VARCHAR(255),
    IN p_dropbox_id INT,
    IN p_courier_id INT,
    IN p_community_id INT
)
BEGIN
    DECLARE dropbox_capacity INT;
    DECLARE courier_verified TINYINT(1);
    DECLARE community_verified TINYINT(1);
    DECLARE dropbox_exists INT;
    DECLARE courier_exists INT;
    DECLARE community_exists INT;

    -- 1. Check apakah dropbox ada
    SELECT COUNT(*) INTO dropbox_exists
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox does not exist!';
    END IF;

    -- 2. Check apakah dropbox full
    SELECT capacity INTO dropbox_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_capacity >= 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox is full!';
    END IF;

    -- 3. Check apakah courier exists dan is verified
    SELECT COUNT(*) INTO courier_exists
    FROM courier
    WHERE courier_id = p_courier_id AND is_verified = 1 AND status = 'Approved';

    IF courier_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Courier is not verified or approved!';
    END IF;

    -- 4. Check apakah community exists dan is verified
    SELECT COUNT(*) INTO community_exists
    FROM community
    WHERE community_id = p_community_id AND is_verified = 1;

    IF community_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "You're not verified!";
    END IF;

    -- 5. Insert data into pickup_waste jika semua conditions terpenuhi
    INSERT INTO pickup_waste (
        pickup_date, pickup_address, dropbox_id, courier_id, community_id, pickup_status
    ) VALUES (
        p_pickup_date, p_pickup_address, p_dropbox_id, p_courier_id, p_community_id, 'pending'
    );

END //

DELIMITER ;



-- Contoh pemanggilan
CALL add_pickup_waste(
    '2024-11-03',                  -- p_pickup_date: Tanggal pengambilan limbah
    'Jl. Setiabudi No. 45',         -- p_pickup_address: Alamat pengambilan
    1,                              -- p_dropbox_id: ID Dropbox
    2,                              -- p_courier_id: ID Kurir
    3                               -- p_community_id: ID Komunitas
);
