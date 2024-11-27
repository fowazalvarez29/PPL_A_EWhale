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
('Lutfi', 'lutfi@email.com', 'password1', '2000-05-15', 'Jl. Mawar No. 1', '085959666999', NULL, 1, 1),
('Fauzi', 'fauzi@email.com', 'password2', '2000-08-22', 'Jl. Melati No. 2', '08169696969', NULL, 1, 0),
('Malwi', 'malwi@email.com', 'password3', '2000-12-10', 'Jl. Anggrek No. 3', '085959666991', NULL, 1, 0);

-- Data Dummy untuk Dropbox
INSERT INTO dropbox (name, address, district_address, longitude, latitude, capacity, status)
VALUES
('Dropbox 1', 'Jl. Example No.1', 'Bandung Utara', 106.845599, -6.208763, 50, 'Available'),
('Dropbox 2', 'Jl. Example No.2', 'Bandung Selatan', 106.845600, -6.208764, 99, 'Available'),
('Dropbox 3', 'Jl. Example No.3', 'Bandung Timur', 106.845601, -6.208765, 0, 'Available'),
('Dropbox 4', 'Jl. Example No.4', 'Bandung Barat', 106.845602, -6.208766, 100, 'Full'),
('Dropbox 5', 'Jl. Example No.5', 'Cimahi', 106.845603, -6.208767, 60, 'Available');

-- Data Dummy untuk Waste Type
INSERT INTO waste_type (waste_type_name)
VALUES
('Peralatan rumah tangga besar'),
('Peralatan rumah tangga kecil'),
('Peralatan IT'),
('Lampu'),
('Mainan'),
('Peralatan elektronik lainnya');

COMMIT;

-- Data Dummy untuk Waste yang relevan dengan setiap kategori
-- 1. Peralatan rumah tangga besar
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Kulkas', 100, 1, NULL, 'Peralatan rumah tangga besar untuk pendinginan'),
('Mesin Cuci', 100, 1, NULL, 'Peralatan rumah tangga untuk mencuci pakaian'),
('AC', 75, 1, NULL, 'Peralatan pendingin udara'),
('Dispenser', 50, 1, NULL, 'Alat untuk menyalurkan air minum'),
('Televisi >= 32 inch', 20, 1, NULL, 'Televisi berukuran besar'),
('Peralatan besar lainnya', 40, 1, NULL, 'Limbah peralatan besar lainnya');

-- 2. Peralatan rumah tangga kecil
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Blender', 25, 2, NULL, 'Alat untuk menghaluskan bahan makanan'),
('Pemanggang Roti', 20, 2, NULL, 'Alat untuk memanggang roti'),
('Vacuum Cleaner', 40, 2, NULL, 'Alat pembersih debu'),
('Setrika', 15, 2, NULL, 'Alat untuk merapikan pakaian'),
('Hairdryer', 10, 2, NULL, 'Pengering rambut'),
('Oven Kecil', 15, 2, NULL, 'Oven berukuran kecil'),
('Microwave', 30, 2, NULL, 'Alat pemanas makanan'),
('Kipas Angin', 15, 2, NULL, 'Alat untuk menghasilkan angin'),
('Peralatan kecil lainnya', 20, 2, NULL, 'Limbah peralatan kecil lainnya');

-- 3. Peralatan IT
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Komputer', 50, 3, NULL, 'Perangkat elektronik untuk komputasi'),
('Laptop', 40, 3, NULL, 'Komputer portabel'),
('Smartphone', 30, 3, NULL, 'Telepon pintar'),
('Tablet', 35, 3, NULL, 'Komputer layar sentuh portabel'),
('Printer', 20, 3, NULL, 'Alat untuk mencetak dokumen'),
('Router', 5, 3, NULL, 'Alat jaringan untuk koneksi internet'),
('Peralatan IT lainnya', 7, 3, NULL, 'Limbah perangkat IT lainnya');

-- 4. Lampu
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Lampu Fluorescent', 3, 4, NULL, 'Lampu tabung hemat energi'),
('Lampu LED', 1, 4, NULL, 'Lampu LED berdaya rendah'),
('Smartlamp', 5, 4, NULL, 'Lampu pintar yang dapat dikontrol'),
('Lampu lainnya', 1, 4, NULL, 'Limbah lampu jenis lainnya');

-- 5. Mainan
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Robot', 8, 5, NULL, 'Mainan elektronik berbentuk robot'),
('Drone', 20, 5, NULL, 'Pesawat tanpa awak untuk bermain'),
('Konsol Permainan', 40, 5, NULL, 'Perangkat elektronik untuk bermain game'),
('Mainan elektronik lainnya', 10, 5, NULL, 'Limbah mainan elektronik lainnya');

-- 6. Peralatan elektronik lainnya
INSERT INTO waste (waste_name, point, waste_type_id, image, description)
VALUES
('Baterai Besar', 25, 6, NULL, 'Limbah baterai berukuran besar'),
('Terminal', 2, 6, NULL, 'Alat sambungan listrik');


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