-- Create Users Table (Managed by Member 1)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('HR_Admin', 'Project_Manager', 'Finance_Admin', 'Employee') NOT NULL,
    status ENUM('Pending_IT', 'Pending_Finance', 'Active') DEFAULT 'Pending_IT',
    salary DECIMAL(10, 2) DEFAULT 0.00
);

-- Create Projects Table (Managed by Member 2)
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    budget DECIMAL(12, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create Allocations Table (Managed by Member 3 & Member 2)
CREATE TABLE allocations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    project_id INT,
    allocation_percentage INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);
