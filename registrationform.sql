use registrationform;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    address TEXT,
    password VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

desc users;

INSERT INTO users (name, email, address, password, gender) 
VALUES ('Shashank', 'shashank@gmail.com', 'Bagngalore', 'shashank1727', 'Male');

select * from users;