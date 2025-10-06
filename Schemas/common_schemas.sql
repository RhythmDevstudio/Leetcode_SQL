-- Common LeetCode Database Schemas
-- These are frequently used table structures in LeetCode SQL problems

-- Employee Table (Very common in LeetCode problems)
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT,
    managerId INT
);

-- Department Table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Person Table (Used in many basic problems)
CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    firstName VARCHAR(255),
    lastName VARCHAR(255)
);

-- Orders Table (E-commerce related problems)
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    orderDate DATE,
    amount DECIMAL(10,2)
);

-- Customer Table
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    referrerId INT
);

-- Activity Table (User activity tracking)
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Scores Table (Gaming/Competition problems)
CREATE TABLE Scores (
    id INT PRIMARY KEY,
    score DECIMAL(3,2)
);

-- Weather Table (Temperature/Date problems)
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

-- Sales Table (Sales analysis problems)
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year)
);

-- Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

-- Students and Courses (Education domain)
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Courses (
    student_id INT,
    course_name VARCHAR(255),
    PRIMARY KEY (student_id, course_name)
);

-- Cinema Table (Entertainment domain)
CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating DECIMAL(2,1)
);

-- Logs Table (System logs/analytics)
CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT
);

-- Tree Table (Hierarchical data)
CREATE TABLE Tree (
    id INT PRIMARY KEY,
    p_id INT
);

-- Sample data inserts for testing (commented out)
/*
-- Employee sample data
INSERT INTO Employee VALUES 
(1, 'Joe', 85000, 1, 3),
(2, 'Henry', 80000, 2, 4),
(3, 'Sam', 60000, 2, NULL),
(4, 'Max', 90000, 1, NULL);

-- Department sample data
INSERT INTO Department VALUES 
(1, 'IT'),
(2, 'Sales');
*/