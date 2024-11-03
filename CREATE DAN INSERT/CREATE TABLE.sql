START TRANSACTION;

-- Tabel community untuk data masyarakat
CREATE TABLE community (
    community_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    address VARCHAR(255),
    photo VARCHAR(255),
    is_verified TINYINT(1) DEFAULT 0, -- 0 = belum terverifikasi, 1 = terverifikasi
    otp_code VARCHAR(6),
    otp_expiry TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel courier untuk data kurir
CREATE TABLE courier (
    courier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    address VARCHAR(255),
    account_number VARCHAR(50),
    nik VARCHAR(20) UNIQUE,
    ktp_url VARCHAR(255),
    kk_url VARCHAR(255),
    photo VARCHAR(255),
    is_verified TINYINT(1) DEFAULT 0, -- 0 = belum terverifikasi, 1 = terverifikasi
    is_active TINYINT(1) DEFAULT 1, -- 0 = tidak aktif, 1 = aktif
    otp_code VARCHAR(6),
    otp_expiry TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel management untuk data pengguna dari bagian manajemen
CREATE TABLE management (
    management_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    address VARCHAR(255),
    phone VARCHAR(15),
    photo VARCHAR(255),
    is_active TINYINT(1) DEFAULT 1, -- 0 = tidak aktif, 1 = aktif
    is_admin TINYINT(1) DEFAULT 0, -- 0 = Management, 1 = Admin
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Tabel dropbox untuk data drop box sampah elektronik
CREATE TABLE dropbox (
    dropbox_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    longitude DECIMAL(11, 8),
    latitude DECIMAL(11, 8),
    capacity INT DEFAULT 0 CHECK (capacity BETWEEN 0 AND 1000),
    status ENUM('Full', 'Available') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel waste_type untuk data jenis dan kategori sampah elektronik
CREATE TABLE waste_type (
    waste_type_id INT AUTO_INCREMENT PRIMARY KEY,
    waste_type_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel waste untuk data sampah elektronik
CREATE TABLE waste (
    waste_id INT AUTO_INCREMENT PRIMARY KEY,
    waste_name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    point INT DEFAULT 0 CHECK (point_value >= 0),
    waste_type_id INT,
    image VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (waste_type_id) REFERENCES waste_type(waste_type_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabel pickup_waste untuk data permintaan penjemputan sampah elektronik
CREATE TABLE pickup_waste (
    pickup_id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_date DATE NOT NULL,
    pickup_address VARCHAR(255) NOT NULL,
    district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat') DEFAULT NULL,
    pickup_status ENUM('pending', 'accepted', 'completed', 'cancelled') DEFAULT 'pending',
    dropbox_id INT,
    courier_id INT,
    community_id INT,
    management_id INT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dropbox_id) REFERENCES dropbox(dropbox_id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (courier_id) REFERENCES courier(courier_id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (community_id) REFERENCES community(community_id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (management_id) REFERENCES management(management_id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabel pickup_detail untuk mencatat detail sampah elektronik yang diambil dalam setiap penjemputan
CREATE TABLE pickup_detail (
    pickup_id INT,
    waste_id INT,
    quantity INT DEFAULT 0 CHECK (quantity >= 0),
    points INT DEFAULT 0 CHECK (points >= 0),
    PRIMARY KEY (pickup_id, waste_id),
    FOREIGN KEY (pickup_id) REFERENCES pickup_waste(pickup_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (waste_id) REFERENCES waste(waste_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabel community_points untuk mencatat poin yang dikumpulkan oleh masyarakat
CREATE TABLE community_points (
    points_id INT AUTO_INCREMENT PRIMARY KEY,
    community_id INT UNIQUE,
    total_points INT DEFAULT 0 CHECK(total_points >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (community_id) REFERENCES community(community_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabel courier_points untuk mencatat total sampah elektronik yang diambil oleh kurir
CREATE TABLE courier_points (
    points_id INT AUTO_INCREMENT PRIMARY KEY,
    courier_id INT UNIQUE,
    total_waste INT DEFAULT 0 CHECK(total_waste >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (courier_id) REFERENCES courier(courier_id) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMIT;