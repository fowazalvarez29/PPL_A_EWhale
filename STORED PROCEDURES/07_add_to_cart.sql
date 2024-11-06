DELIMITER //

DROP PROCEDURE IF EXISTS add_to_cart //

CREATE PROCEDURE add_to_cart (
    IN p_community_id INT,
    IN p_waste_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE existing_quantity INT DEFAULT 0;

    -- Check if the item already exists in the cart
    SELECT quantity INTO existing_quantity
    FROM pickup_detail
    WHERE community_id = p_community_id AND waste_id = p_waste_id;

    IF existing_quantity IS NOT NULL THEN
        -- Update the quantity if item exists
        UPDATE pickup_detail
        SET quantity = quantity + p_quantity
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    ELSE
        -- Insert new item if it does not exist
        INSERT INTO pickup_detail (community_id, waste_id, quantity)
        VALUES (p_community_id, p_waste_id, p_quantity);
    END IF;

END //

DELIMITER ;

-- contoh pemanggilan
CALL add_to_cart (
    1,      -- community id 
    1,      -- waste id
    5       -- quantity
);