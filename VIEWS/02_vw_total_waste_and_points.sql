CREATE VIEW vw_total_waste_and_points AS
SELECT 
    SUM(pd.quantity) AS total_waste_collected,
    SUM(pd.points) AS total_points_collected
FROM 
    pickup_detail pd;