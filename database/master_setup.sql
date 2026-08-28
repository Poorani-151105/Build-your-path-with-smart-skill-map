-- SMART SKILL MAP - MASTER SETUP SCRIPT
-- This script fixes all database mismatches and seeds the initial data.

SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS smartskillmap;
CREATE DATABASE smartskillmap;
USE smartskillmap;

-- 1. Users Table (Matches com.smartskillmap.model.User)
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(20) DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    enrolled_career_id BIGINT,
    progress_json TEXT
);

-- 2. Skills Table (Matches com.smartskillmap.model.Skill)
CREATE TABLE skills (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('TECHNICAL', 'COGNITIVE', 'SOFT') NOT NULL,
    description TEXT
);

-- 3. User Skills Table (Stores scores)
CREATE TABLE user_skills (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    score INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

-- 4. Career Paths Table (Matches com.smartskillmap.model.CareerPath)
CREATE TABLE career_paths (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    roadmap_json JSON,
    daily_track_json TEXT, 
    requirement_json JSON,
    courses_json JSON,
    sub_domain VARCHAR(100),
    path_type VARCHAR(50),
    domain_category VARCHAR(50)
);

-- 5. Assessments Table (Matches com.smartskillmap.model.Assessment)
CREATE TABLE assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    target_skill_name VARCHAR(100),
    questions_json JSON 
);

-- 6. User Assessments Table (History)
CREATE TABLE user_assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    assessment_id BIGINT NOT NULL,
    score INT,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE
);

-- 7. SEED DATA
INSERT INTO skills (name, category, description) VALUES 
('Java Programming', 'TECHNICAL', 'Core Java and Spring Boot'),
('Aptitude', 'COGNITIVE', 'Logical and analytical reasoning');

INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Technical Basics', 'TECHNICAL', 'Java Programming', '[
    {"question": "What is JVM?", "options": ["Java Virtual Machine", "Visual Monitor"], "answer": 0},
    {"question": "What is SQL?", "options": ["Query Language", "Simple Quick"], "answer": 0}
]');

SET FOREIGN_KEY_CHECKS = 1;
