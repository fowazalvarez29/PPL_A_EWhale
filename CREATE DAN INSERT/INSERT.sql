START TRANSACTION;

-- Data Dummy untuk Courier
INSERT INTO courier (name, email, password, phone, date_of_birth, address, nik, account_number, ktp_url, kk_url, photo, otp_code, otp_expiry, is_verified, status)
VALUES
('Haykal', 'haykal@email.com', 'password1', '08123456701', '2000-01-01', 'Address 1', '1234567890123451', '1234567891', NULL, NULL, NULL, NULL, NULL, 1, 'Approved'),
('Faqih', 'faqih@email.com', 'password2', '08123456702', '2000-01-01', 'Address 2', '1234567890123452', '1234567892', NULL, NULL, NULL, NULL, NULL, 0, 'Pending'),
('Fowaz', 'fowaz@email.com', 'password3', '08123456703', '2000-01-01', 'Address 3', '1234567890123453', '1234567893', NULL, NULL, NULL, NULL, NULL, 1, 'Approved'),
('Daffa', 'daffa@email.com', 'password4', '08123456704', '2000-01-01', 'Address 4', '1234567890123454', '1234567894', NULL, NULL, NULL, NULL, NULL, 1, 'Approved'),
('Ardhi', 'ardhi@email.com', 'password5', '08123456705', '2000-01-01', 'Address 5', '1234567890123455', '1234567895', NULL, NULL, NULL, NULL, NULL, 1, 'Approved');

-- Data Dummy untuk Community
INSERT INTO community (name, email, password, phone, date_of_birth, address, photo, is_verified, otp_code, otp_expiry)
VALUES
('Indri', 'indri@email.com', 'password1', '08123456101', '2000-01-01', 'Sumarecon', NULL, 1, NULL, NULL),
('Agam', 'agam@email.com', 'password2', '08123456102', '2000-01-01', 'Tahura', NULL, 0, NULL, NULL),
('Agung', 'agung@email.com', 'password3', '08123456103', '2000-01-01', 'Cihampelas', NULL, 1, NULL, NULL),
('Adit', 'adit@email.com', 'password4', '08123456104', '2000-01-01', 'Cimahi', NULL, 1, NULL, NULL),
('Gilman', 'gilman@email.com', 'password5', '08123456105', '2000-01-01', 'Cileunyi', NULL, 0, NULL, NULL);

-- Data Dummy untuk Tabel Management
INSERT INTO management (name, email, password, date_of_birth, address, phone, photo, is_verified, is_admin)
VALUES
('Lutfi', 'lutfi@email.com', 'password1', '2000-05-15', 'Jl. Mawar No. 1', NULL, NULL, 1, 1),
('Fauzi', 'fauzi@email.com', 'password2', '2000-08-22', 'Jl. Melati No. 2', NULL, NULL, 1, 0),
('Malwi', 'malwi@email.com', 'password3', '2000-12-10', 'Jl. Anggrek No. 3', NULL, NULL, 1, 0);

-- Data Dummy untuk Dropbox
INSERT INTO dropbox (name, address, district_address, longitude, latitude, capacity, status)
VALUES
('Dropbox 1', 'Jl. Example No.1', 'Bandung Utara', 106.845599, -6.208763, 50, 'Available'),
('Dropbox 2', 'Jl. Example No.2', 'Bandung Selatan', 106.845600, -6.208764, 100, 'Available'),
('Dropbox 3', 'Jl. Example No.3', 'Bandung Timur', 106.845601, -6.208765, 75, 'Available'),
('Dropbox 4', 'Jl. Example No.4', 'Bandung Barat', 106.845602, -6.208766, 150, 'Full'),
('Dropbox 5', 'Jl. Example No.5', 'Cimahi', 106.845603, -6.208767, 60, 'Available');

-- Data Dummy untuk Waste Type
INSERT INTO waste_type (waste_type_name)
VALUES
('Large Household Apllience'),
('Small Household Appliances'),
('IT Equipment'),
('Lamps'),
('Toys'),
('Screens and Monitors'),
('Other Electronic Devices');

COMMIT;

-- Data Dummy untuk Waste yang relevan dengan setiap kategori
INSERT INTO waste (waste_name, category, point, waste_type_id, image, description)
VALUES
('Washing Machine', 'Large Household Appliance', 50, 1, NULL, 'Large household appliance for washing clothes'),
('Hand Blender', 'Small Household Appliances', 10, 2, NULL, 'Compact blender for small-scale food preparation'),
('Laptop', 'IT Equipment', 25, 3, NULL, 'Portable computer device for work and entertainment'),
('Fluorescent Lamp', 'Lamps', 5, 4, NULL, 'Energy-saving fluorescent lighting device'),
('Electronic Toy Car', 'Toys', 8, 5, NULL, 'Battery-powered electronic toy car for children'),
('LCD Monitor', 'Screens and Monitors', 20, 6, NULL, 'LCD monitor for computer displays'),
('Digital Camera', 'Other Electronic Devices', 15, 7, NULL, 'Portable digital camera for capturing photos');


-- Mengatur kembali ID agar dimulai dari 1

START TRANSACTION;
ALTER TABLE courier AUTO_INCREMENT = 1;
ALTER TABLE community AUTO_INCREMENT = 1;
ALTER TABLE dropbox AUTO_INCREMENT = 1;
ALTER TABLE management AUTO_INCREMENT = 1;
ALTER TABLE waste_type AUTO_INCREMENT = 1;
ALTER TABLE waste AUTO_INCREMENT = 1;
ALTER TABLE pickup_waste AUTO_INCREMENT = 1;
ALTER TABLE pickup_detail AUTO_INCREMENT = 1;
ALTER TABLE courier_points AUTO_INCREMENT = 1;
ALTER TABLE community_points AUTO_INCREMENT = 1;
COMMIT;