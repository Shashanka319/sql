CREATE DATABASE IF NOT EXISTS hotel_reservation_db;
USE hotel_reservation_db;

-- Drop in dependency order
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS users;

-- 1. Users Table (Customer and Admin Accounts)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'CUSTOMER'
);

-- 2. Guests Table
CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

-- 3. Rooms Table
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number INT NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(500),
    status VARCHAR(20) DEFAULT 'AVAILABLE'
);

-- 4. Reservations Table
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    user_id INT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'CONFIRMED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_res_guest FOREIGN KEY (guest_id) REFERENCES guests(guest_id) ON DELETE CASCADE,
    CONSTRAINT fk_res_room FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE RESTRICT,
    CONSTRAINT fk_res_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- 5. Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(100) NOT NULL UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'SUCCESS',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pay_res FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id) ON DELETE CASCADE
);

-- Default Accounts
INSERT INTO users (full_name, email, username, password_hash, role) VALUES 
('Hotel Admin', 'admin@hotel.com', 'admin', 'admin123', 'ADMIN'),
('Sharath Customer', 'sharath@example.com', 'sharath', 'sharath123', 'CUSTOMER');

-- 80 Rooms (10 per Category in INR ₹)
-- 1. Standard Classic (101-110)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(101, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(102, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(103, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(104, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(105, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(106, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(107, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(108, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(109, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(110, 'Standard Classic', 1899.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 2. Deluxe Single (201-210)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(201, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(202, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(203, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(204, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(205, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(206, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(207, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(208, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(209, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(210, 'Deluxe Single', 2799.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 3. Deluxe Double (301-310)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(301, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(302, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(303, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(304, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(305, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(306, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(307, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(308, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(309, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(310, 'Deluxe Double', 4499.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 4. Executive Suite (401-410)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(401, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(402, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(403, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(404, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(405, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(406, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(407, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(408, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(409, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(410, 'Executive Suite', 7499.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 5. Family Suite (501-510)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(501, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(502, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(503, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(504, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(505, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(506, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(507, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(508, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(509, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(510, 'Family Suite', 9999.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 6. Honeymoon Suite (601-610)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(601, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(602, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(603, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(604, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(605, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(606, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(607, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(608, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(609, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(610, 'Honeymoon Suite', 12499.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 7. Royal Penthouse (701-710)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(701, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(702, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(703, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(704, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(705, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(706, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(707, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(708, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(709, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(710, 'Royal Penthouse', 18999.00, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');

-- 8. Garden Villa (801-810)
INSERT INTO rooms (room_number, room_type, price_per_night, image_url, status) VALUES 
(801, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(802, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(803, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(804, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(805, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1591088398332-8a7791972843?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(806, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(807, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(808, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(809, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', 'AVAILABLE'),
(810, 'Garden Villa', 24999.00, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', 'AVAILABLE');
select * from users;
select * from rooms;
select * from reservations;