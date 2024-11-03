DELIMITER //

CREATE TRIGGER tr_points_courier_community
AFTER UPDATE ON pickup_waste
FOR EACH ROW
BEGIN
    DECLARE total_points INT DEFAULT 0;

    -- Cek jika status baru adalah 'completed'
    IF NEW.pickup_status = 'completed' THEN
        -- Menghitung total poin dari pickup_detail untuk pickup yang selesai
        SELECT SUM(points) INTO total_points
        FROM pickup_detail
        WHERE pickup_id = NEW.pickup_id;

        -- Update poin untuk community
        IF NEW.community_id IS NOT NULL THEN
            INSERT INTO community_points (community_id, total_points)
            VALUES (NEW.community_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = total_points + VALUES(total_points);
        END IF;

        -- Update total waste untuk courier
        IF NEW.courier_id IS NOT NULL THEN
            INSERT INTO courier_points (courier_id, total_points)
            VALUES (NEW.courier_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = total_points + VALUES(total_points);
        END IF;
    END IF;
END //

DELIMITER ;