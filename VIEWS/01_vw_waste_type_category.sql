CREATE OR REPLACE VIEW vw_waste_type_category AS
SELECT 
    w.waste_id AS id,
    w.waste_name AS Name,
    wt.waste_type_name AS 'Waste Type',
    w.description AS Description
FROM 
    waste w
JOIN 
    waste_type wt ON w.waste_type_id = wt.waste_type_id;