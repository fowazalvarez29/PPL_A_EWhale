DELIMITER //

DROP TRIGGER IF EXISTS tr_pickup_detail_total_points //

CREATE TRIGGER tr_pickup_detail_total_points
BEFORE INSERT ON pickup_detail
FOR EACH ROW
BEGIN
    DECLARE waste_point INT;

    -- Mendapatkan point dari tabel waste berdasarkan waste_id yang dimasukkan
    SELECT point INTO waste_point
    FROM waste
    WHERE waste_id = NEW.waste_id;

    -- Menghitung total points berdasarkan quantity dan point dari waste
    SET NEW.points = waste_point * NEW.quantity;
END //

DELIMITER ;