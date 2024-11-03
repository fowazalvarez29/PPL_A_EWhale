DELIMITER //

CREATE TRIGGER tr_check_courier_community_status
BEFORE INSERT ON pickup_waste
FOR EACH ROW
BEGIN
    -- Periksa apakah courier memenuhi syarat
    IF NEW.courier_id IS NOT NULL THEN
        IF NOT is_courier_verified_and_active(NEW.courier_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Courier Not Verified or Active!';
        END IF;
    END IF;

    -- Periksa apakah community memenuhi syarat
    IF NEW.community_id IS NOT NULL THEN
        IF NOT is_community_verified(NEW.community_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "You're Not Verified!";
        END IF;
    END IF;
END //

DELIMITER ;
