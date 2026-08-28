-- Phase 2 Seed Data: Holistic & Multi-Domain
USE smart_skill_map;

-- 1. Additional Skills
INSERT INTO skills (name, category, description) VALUES 
('Logical Reasoning', 'COGNITIVE', 'Ability to analyze situations and find patterns'),
('Creative Thinking', 'COGNITIVE', 'Thinking outside the box for innovative solutions'),
('Leadership', 'SOFT', 'Guiding and motivating teams towards a goal'),
('Time Management', 'SOFT', 'Efficient prioritizing and scheduling of tasks'),
('UX Principles', 'TECHNICAL', 'User-centric design and behavioral analysis'),
('Legal Research', 'TECHNICAL', 'Analyzing precedents and statutory law');

-- 2. Holistic Career Paths
INSERT INTO career_paths (title, description, requirement_json, roadmap_json) VALUES 
('Corporate Lawyer', 'Specializes in business law and corporate transactions.', 
 '{"Communication": 90, "Critical Thinking": 85, "Legal Research": 90, "Logical Reasoning": 80}', 
 '[{"step": 1, "task": "Earn a Bachelor of Laws (LLB)"}, {"step": 2, "task": "Specialization in Corporate Law"}, {"step": 3, "task": "Bar Exam & Internship"}]'),
('UX/UI Designer', 'Creates user-centric digital experiences.', 
 '{"Creative Thinking": 90, "Web Development": 70, "UX Principles": 95, "Communication": 75}', 
 '[{"step": 1, "task": "Learn UX Foundations"}, {"step": 2, "task": "Master Figma/Adobe XD"}, {"step": 3, "task": "Build Portfolio Project"}]'),
('Software Architect', 'Designs high-level software structures and standards.', 
 '{"Java Programming": 95, "Problem Solving": 95, "Critical Thinking": 90, "Leadership": 80}', 
 '[{"step": 1, "task": "Advanced System Design"}, {"step": 2, "task": "Cloud Patterns (AWS/Azure)"}, {"step": 3, "task": "Leading Engineering Teams"}]');

-- 3. Diverse Assessments
INSERT INTO assessments (title, category, questions_json) VALUES 
('Cognitive Aptitude', 'COGNITIVE', '[
    {"question": "If all A are B, and all B are C, then all A are C.", "options": ["True", "False", "Neither"], "answer": "True"},
    {"question": "Find the missing number in sequence: 2, 4, 8, 16, ?", "options": ["20", "24", "32"], "answer": "32"}
]'),
('Soft Skills Challenge', 'SOFT', '[
    {"question": "How do you handle a team conflict?", "options": ["Avoid it", "Address it immediately with active listening", "Tell them to figure it out"], "answer": "Address it immediately with active listening"},
    {"question": "A deadline is missed. What is your first action?", "options": ["Blame the tools", "Inform stakeholders and create a recovery plan", "Ignore and keep working"], "answer": "Inform stakeholders and create a recovery plan"}
]');
