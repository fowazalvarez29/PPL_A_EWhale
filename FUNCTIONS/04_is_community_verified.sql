DELIMITER //

DROP FUNCTION IF EXISTS is_community_verified //

CREATE FUNCTION is_community_verified(communityId INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE verified TINYINT;

    -- Pastikan query hanya mengembalikan satu baris
    SELECT is_verified INTO verified
    FROM community
    WHERE community_id = communityId
    LIMIT 1;

    -- Kembalikan TRUE jika community terverifikasi
    RETURN (verified = 1);
END //

DELIMITER ;
