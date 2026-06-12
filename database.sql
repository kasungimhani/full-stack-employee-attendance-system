-- ABM Consulting Service - Employee Attendance System
-- Database Schema

-- Create database
CREATE DATABASE IF NOT EXISTS abm_consulting;
USE abm_consulting;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    department VARCHAR(50),
    position VARCHAR(50),
    role ENUM('admin', 'employee') DEFAULT 'employee',
    salary DECIMAL(10, 2),
    status ENUM('active', 'inactive') DEFAULT 'active',
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    profile_image VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role),
    INDEX idx_status (status)
);

-- Attendance Table
CREATE TABLE IF NOT EXISTS attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    check_in VARCHAR(8),
    check_out VARCHAR(8),
    worked_hours DECIMAL(4, 2),
    status ENUM('present', 'absent', 'late', 'early-leave') DEFAULT 'present',
    remarks TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_date (user_id, date),
    INDEX idx_user_id (user_id),
    INDEX idx_date (date),
    INDEX idx_status (status)
);

-- Leave Requests Table
CREATE TABLE IF NOT EXISTS leave_requests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    leave_type VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    number_of_days INT NOT NULL,
    reason TEXT NOT NULL,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    approved_by INT,
    approval_date DATETIME,
    comments TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_status (status),
    INDEX idx_start_date (start_date)
);

-- Insert demo admin user (password: 123456)
INSERT INTO users (first_name, last_name, email, password, phone, department, position, role, join_date)
VALUES ('Admin', 'User', 'admin@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345678', 'Administration', 'Admin', 'admin', NOW());

-- Insert demo employee user (password: 123456)
INSERT INTO users (first_name, last_name, email, password, phone, department, position, role, join_date)
VALUES ('John', 'Doe', 'emp@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345679', 'IT', 'Developer', 'employee', NOW());

-- Insert sample employees
INSERT INTO users (first_name, last_name, email, password, phone, department, position, role, join_date)
VALUES 
('Jane', 'Smith', 'jane@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345680', 'HR', 'HR Manager', 'employee', NOW()),
('Michael', 'Johnson', 'michael@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345681', 'Finance', 'Accountant', 'employee', NOW()),
('Sarah', 'Williams', 'sarah@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345682', 'IT', 'Designer', 'employee', NOW()),
('David', 'Brown', 'david@abm.com', '$2y$10$.7RvVhxJuJVKyoIRLe/dPuGVVP2OfuHNWKzxs0K5PcdhQkP9xDi5q', '0112345683', 'Marketing', 'Marketing Manager', 'employee', NOW());

-- Insert sample attendance records for today
INSERT INTO attendance (user_id, date, check_in, check_out, worked_hours, status)
VALUES
(2, CURDATE(), '09:00:00', '17:30:00', 8.5, 'present'),
(3, CURDATE(), '08:45:00', '17:00:00', 8.25, 'present'),
(4, CURDATE(), '09:15:00', '18:00:00', 8.75, 'late'),
(5, CURDATE(), '09:00:00', '17:30:00', 8.5, 'present');

-- Insert sample attendance records for previous dates
INSERT INTO attendance (user_id, date, check_in, check_out, worked_hours, status)
VALUES
(2, DATE_SUB(CURDATE(), INTERVAL 1 DAY), '09:00:00', '17:30:00', 8.5, 'present'),
(3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), '09:30:00', '17:00:00', 7.5, 'late'),
(4, DATE_SUB(CURDATE(), INTERVAL 1 DAY), '09:00:00', '17:30:00', 8.5, 'present'),
(2, DATE_SUB(CURDATE(), INTERVAL 2 DAY), '09:00:00', NULL, NULL, 'absent');

-- Insert sample leave requests
INSERT INTO leave_requests (user_id, leave_type, start_date, end_date, number_of_days, reason, status)
VALUES
(4, 'sick', DATE_ADD(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 6 DAY), 2, 'Medical appointment and recovery', 'pending'),
(5, 'annual', DATE_ADD(CURDATE(), INTERVAL 10 DAY), DATE_ADD(CURDATE(), INTERVAL 14 DAY), 5, 'Vacation', 'pending');

-- Create indexes for better performance
CREATE INDEX idx_user_attendance ON attendance(user_id, date);
CREATE INDEX idx_leave_dates ON leave_requests(start_date, end_date);
