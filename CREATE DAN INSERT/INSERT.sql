START TRANSACTION;

-- Data Dummy untuk Courier
INSERT INTO courier (name, email, password, phone, date_of_birth, address, nik, account_number, ktp_url, kk_url, photo, otp_code, otp_expiry, is_verified, is_active)
VALUES
('Haykal', 'haykal@email.com', 'password1', '08123456701', '2000-01-01', 'Address 1', '1234567890123451', '1234567891', NULL, NULL, NULL, NULL, NULL, 1, 1),
('Faqih', 'faqih@email.com', 'password2', '08123456702', '2000-01-01', 'Address 2', '1234567890123452', '1234567892', NULL, NULL, NULL, NULL, NULL, 0, 1),
('Fowaz', 'fowaz@email.com', 'password3', '08123456703', '2000-01-01', 'Address 3', '1234567890123453', '1234567893', NULL, NULL, NULL, NULL, NULL, 1, 1),
('Daffa', 'daffa@email.com', 'password4', '08123456704', '2000-01-01', 'Address 4', '1234567890123454', '1234567894', NULL, NULL, NULL, NULL, NULL, 1, 0),
('Ardhi', 'ardhi@email.com', 'password5', '08123456705', '2000-01-01', 'Address 5', '1234567890123455', '1234567895', NULL, NULL, NULL, NULL, NULL, 1, 1);

-- Data Dummy untuk Community
INSERT INTO community (name, email, password, phone, date_of_birth, address, photo, is_verified, otp_code, otp_expiry)
VALUES
('Indri', 'indri@email.com', 'password1', '08123456101', '2000-01-01', 'Sumarecon', NULL, 1, NULL, NULL),
('Agam', 'agam@email.com', 'password2', '08123456102', '2000-01-01', 'Tahura', NULL, 0, NULL, NULL),
('Agung', 'agung@email.com', 'password3', '08123456103', '2000-01-01', 'Cihampelas', NULL, 1, NULL, NULL),
('Adit', 'adit@email.com', 'password4', '08123456104', '2000-01-01', 'Cimahi', NULL, 1, NULL, NULL),
('Gilman', 'gilman@email.com', 'password5', '08123456105', '2000-01-01', 'Cileunyi', NULL, 0, NULL, NULL);

-- Data Dummy untuk Tabel Management
INSERT INTO management (name, email, password, date_of_birth, address, photo, is_active, is_admin)
VALUES
('Lutfi', 'lutfi@email.com', 'password1', '2000-05-15', 'Jl. Mawar No. 1', NULL, 1, 1),
('Fauzi', 'fauzi@email.com', 'password2', '2000-08-22', 'Jl. Melati No. 2', NULL, 1, 0),
('Malwi', 'malwi@email.com', 'password3', '2000-12-10', 'Jl. Anggrek No. 3', NULL, 1, 0);


-- Data Dummy untuk Dropbox
INSERT INTO dropbox (name, address, longitude, latitude, capacity, status)
VALUES
('Dropbox 1', 'Bandung Utara', 106.845599, -6.208763, 500, 'Available'),
('Dropbox 2', 'Bandung Selatan', 106.845600, -6.208764, 750, 'Available'),
('Dropbox 3', 'Bandung Timur', 106.845601, -6.208765, 250, 'Available'),
('Dropbox 4', 'Bandung Barat', 106.845602, -6.208766, 1000, 'Full'),
('Dropbox 5', 'Cimahi', 106.845603, -6.208767, 600, 'Available');

-- Data Dummy untuk Waste Type (e-waste)
INSERT INTO waste_type (waste_type_name)
VALUES
('Batteries'),
('Mobile Phones'),
('Computers'),
('Televisions'),
('Small Appliances');

-- ROLLBACK;
COMMIT;

-- Data Dummy untuk Waste
INSERT INTO waste (waste_name, category, point, waste_type_id, image, description)
VALUES
('Lithium Battery', 'Battery', 10, 1, NULL, 'Lithium-based battery used in electronics'),
('Alkaline Battery', 'Battery', 8, 1, NULL, 'Common household battery'),
('Car Battery', 'Battery', 15, 1, NULL, 'Large lead-acid battery used in vehicles'),

('Smartphone', 'Mobile Device', 20, 2, NULL, 'Used or broken smartphone'),
('Feature Phone', 'Mobile Device', 10, 2, NULL, 'Non-smartphone mobile device'),
('Tablet', 'Mobile Device', 25, 2, NULL, 'Tablet device used for browsing and media'),

('Desktop Computer', 'Computer', 30, 3, NULL, 'Full desktop computer setup'),
('Laptop', 'Computer', 25, 3, NULL, 'Portable computer device'),
('PC Monitor', 'Computer', 15, 3, NULL, 'Computer display monitor'),

('CRT TV', 'Television', 20, 4, NULL, 'Old-style CRT television'),
('LED TV', 'Television', 30, 4, NULL, 'Modern LED television'),
('Plasma TV', 'Television', 25, 4, NULL, 'Older plasma screen television'),

('Microwave', 'Small Appliance', 15, 5, NULL, 'Kitchen microwave appliance'),
('Blender', 'Small Appliance', 10, 5, NULL, 'Kitchen blender for food preparation'),
('Toaster', 'Small Appliance', 8, 5, NULL, 'Small kitchen appliance for toasting bread');

-- Untuk mendelete dan mengulangi id kembali ke 1
-- DELETE FROM waste;
-- ALTER TABLE waste AUTO_INCREMENT = 1;

START TRANSACTION;
ALTER TABLE courier AUTO_INCREMENT = 1;
ALTER TABLE community AUTO_INCREMENT = 1;
ALTER TABLE dropbox AUTO_INCREMENT = 1;
ALTER TABLE management AUTO_INCREMENT = 1;
ALTER TABLE waste_type AUTO_INCREMENT = 1;
ALTER TABLE waste AUTO_INCREMENT = 1;
ALTER TABLE pickup_waste AUTO_INCREMENT = 1;
ALTER TABLE pickup_detail AUTO_INCREMENT = 1;
COMMIT;