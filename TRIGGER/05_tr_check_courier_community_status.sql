DELIMITER //

CREATE TRIGGER tr_check_courier_community_status
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE courier_status INT;
    DECLARE community_status INT;

    -- Periksa status kurir (is_verified dan is_active)
    IF NEW.courier_id IS NOT NULL THEN
        SELECT is_verified, is_active INTO courier_status
        FROM courier
        WHERE courier_id = NEW.courier_id;

        -- Jika kurir tidak terverifikasi atau tidak aktif, maka transaksi dibatalkan
        IF courier_status = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Transaksi dibatalkan: Kurir belum terverifikasi atau tidak aktif.';
        END IF;
    END IF;

    -- Periksa status masyarakat (is_verified)
    IF NEW.community_id IS NOT NULL THEN
        SELECT is_verified INTO community_status
        FROM community
        WHERE community_id = NEW.community_id;

        -- Jika masyarakat belum terverifikasi, maka transaksi dibatalkan
        IF community_status = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Transaksi dibatalkan: Masyarakat belum terverifikasi.';
        END IF;
    END IF;
END //

DELIMITER ;
