DELIMITER //

DROP PROCEDURE IF EXISTS remove_from_cart //

CREATE PROCEDURE remove_from_cart (
    IN p_community_id INT,
    IN p_waste_id INT
)
BEGIN
    -- Remove item from cart
    DELETE FROM pickup_detail
    WHERE community_id = p_community_id AND waste_id = p_waste_id;

END //

DELIMITER ;

-- contoh pemanggilan
CALL remove_from_cart  (
    1,      -- community id 
    1       -- waste id
);