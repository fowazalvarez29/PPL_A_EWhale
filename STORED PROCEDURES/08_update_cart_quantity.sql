DELIMITER //

DROP PROCEDURE IF EXISTS update_cart_quantity //

CREATE PROCEDURE update_cart_quantity (
    IN p_community_id INT,
    IN p_waste_id INT,
    IN p_quantity INT
)
BEGIN
    IF new_quantity > 0 THEN
        -- Update quantity if new quantity is greater than zero
        UPDATE pickup_detail
        SET quantity = p_quantity
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    ELSE
        -- Remove item if new quantity is zero or less
        DELETE FROM pickup_detail
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    END IF;

END //

DELIMITER ;

-- contoh pemanggilan
CALL update_cart_quantity  (
    1,      -- community id 
    1,      -- waste id
    5       -- quantity yang baru
);