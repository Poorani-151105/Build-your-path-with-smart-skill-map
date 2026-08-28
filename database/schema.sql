-- Smart Skill Map System - Database Schema

CREATE DATABASE IF NOT EXISTS smart_skill_map;
USE smart_skill_map;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(20) DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Skills Table
CREATE TABLE IF NOT EXISTS skills (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('TECHNICAL', 'COGNITIVE', 'SOFT') NOT NULL,
    description TEXT
);

-- User Skills Table (Stores scores)
CREATE TABLE IF NOT EXISTS user_skills (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    score INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

-- Career Paths Table
CREATE TABLE IF NOT EXISTS career_paths (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    roadmap_json JSON, -- Stores steps/courses
    requirement_json JSON -- Stores required skill scores
);

-- Assessments Table
CREATE TABLE IF NOT EXISTS assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category ENUM('TECHNICAL', 'COGNITIVE', 'SOFT') NOT NULL,
    questions_json JSON -- Stores array of questions {question, options, correctAnswer}
);

-- User Assessments Table (History)
CREATE TABLE IF NOT EXISTS user_assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    assessment_id BIGINT NOT NULL,
    score INT,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE
);

-- Seed Initial Data
INSERT INTO skills (name, category, description) VALUES 
('Java Programming', 'TECHNICAL', 'Core Java, Spring Boot, and Enterprise development'),
('Web Development', 'TECHNICAL', 'HTML, CSS, JS, and Modern Frameworks'),
('Database Management', 'TECHNICAL', 'SQL, NoSQL, and Data Modeling'),
('Critical Thinking', 'COGNITIVE', 'Analyzing information and logical reasoning'),
('Problem Solving', 'COGNITIVE', 'Solving complex algorithmic and architectural challenges'),
('Communication', 'SOFT', 'Verbal and written interaction'),
('Teamwork', 'SOFT', 'Collaborating in agile environments');

INSERT INTO career_paths (title, description, requirement_json, roadmap_json) VALUES 
('Full Stack Developer', 'Expert in both frontend and backend technologies.', 
 '{"Java Programming": 80, "Web Development": 85, "Database Management": 75, "Communication": 70}', 
 '[{"step": 1, "task": "Learn Java Fundamentals"}, {"step": 2, "task": "Master Spring Boot"}, {"step": 3, "task": "Learn React/Vanilla JS Frontend"}]'),
('Backend Engineer', 'Specializes in server-side logic and databases.', 
 '{"Java Programming": 90, "Database Management": 85, "Problem Solving": 80}', 
 '[{"step": 1, "task": "Advanced Java Concurrency"}, {"step": 2, "task": "System Design"}, {"step": 3, "task": "Microservices Architecture"}]');

INSERT INTO assessments (title, category, questions_json) VALUES 
('Technical Basics', 'TECHNICAL', '[
    {"question": "What is JVM?", "options": ["Java Virtual Machine", "Java Very Much", "Java Visual Monitor"], "answer": "Java Virtual Machine"},
    {"question": "What is SQL?", "options": ["Structured Query Language", "Simple Quick Language"], "answer": "Structured Query Language"}
]');
