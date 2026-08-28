USE smart_skill_map;

-- 1. Ensure Columns Exist
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS path_type VARCHAR(50);
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS domain_category VARCHAR(100);

-- 2. Wipe Previous Data
DELETE FROM career_paths;
DELETE FROM assessments;

-- 🔷 1. PROFESSIONAL COURSES (Engineering)
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Computer Science Engineering', 'ENGINEERING', 'PROFESSIONAL', 'Software Sys', 'Core foundation of software and hardware systems.', '["Logic & Flow", "OS Basics", "Networking Fundamentals", "Software Engineering Principles", "Cloud Deployment", "Security Best Practices", "Project Phase"]', '{"Java Programming": 85, "Problem Solving": 80}'),
('Data Science', 'ENGINEERING', 'PROFESSIONAL', 'Analytics', 'Extracting insights from complex data sets.', '["Python for Data", "Statistical Analysis", "Data Cleaning", "Visualization Tools", "Predictive Modeling", "Big Data Intro", "Discovery Lab"]', '{"Aptitude": 90, "Problem Solving": 85}'),
('Artificial Intelligence', 'ENGINEERING', 'PROFESSIONAL', 'ML/DL', 'Developing intelligent systems and algorithms.', '["Linear Algebra", "ML Fundamentals", "Neural Networks", "NLP Basics", "Computer Vision", "AI Ethics", "Bot Challenge"]', '{"Problem Solving": 95, "Aptitude": 90}'),
('Cyber Security', 'ENGINEERING', 'PROFESSIONAL', 'Infosec', 'Protecting networks and systems from digital attacks.', '["Network Security", "Ethical Hacking", "Cryptography", "Risk Management", "Compliance", "Incident Response", "CTF Competition"]', '{"Problem Solving": 85, "Aptitude": 80}');

-- 🏥 Medical
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('MBBS', 'MEDICAL', 'PROFESSIONAL', 'General Med', 'Bachelor of Medicine and Bachelor of Surgery.', '["Anatomy", "Physiology", "Biochemistry", "Pathology", "Microbiology", "Pharmacology", "Clinical Ward"]', '{"Medical Science": 90, "Problem Solving": 80}'),
('BDS Dental', 'MEDICAL', 'PROFESSIONAL', 'Oral Health', 'Expertise in oral and dental medical care.', '["Dental Anatomy", "Oral Pathology", "Periodontics", "Orthodontics", "Prosthodontics", "Oral Surgery", "Clinical Lab"]', '{"Medical Science": 80, "Problem Solving": 70}'),
('Pharmacy', 'MEDICAL', 'PROFESSIONAL', 'Drug Science', 'Development and management of pharmaceutical drugs.', '["Pharmaceutics", "Medicinal Chemistry", "Pharmacognosy", "Biotoxicity", "Clinical Pharmacy", "Dispensing Lab", "Regulatory Affairs"]', '{"Medical Science": 85, "Problem Solving": 75}');

-- ⚖️ Law
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Corporate Law', 'LAW', 'PROFESSIONAL', 'M&A', 'Legal mastery of business transactions and mergers.', '["Legal Systems", "Contract Law", "Corporate Governance", "Trade Regulations", "Drafting", "Arbitration", "M&A Case"]', '{"Legal Reasoning": 95, "Communication": 90}'),
('Criminal Law', 'LAW', 'PROFESSIONAL', 'Litigation', 'Representing cases involving digital and social crime.', '["Criminal Procedure", "Evidence Act", "Penal Codes", "Victimology", "Forensic Law", "Cross Examination", "Mock Trial"]', '{"Legal Reasoning": 85, "Communication": 85}');

-- 📊 Business
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Marketing MBA', 'BUSINESS', 'PROFESSIONAL', 'Strategic', 'Mastering market research and brand growth strategies.', '["Consumer Behavior", "Digital Strategy", "Market Research", "Brand Management", "Supply Chain", "Global Business", "Marketing Plan"]', '{"Business Strategy": 90, "Communication": 85}'),
('Finance MBA', 'BUSINESS', 'PROFESSIONAL', 'Investment', 'Specialized track for high-end financial management.', '["Financial Analysis", "Capital Markets", "Derivatives", "Risk Analysis", "Mergers", "Portfolio Mgmt", "Investment Pitch"]', '{"Business Strategy": 85, "Aptitude": 90}');

-- 🧾 Chartered / Finance (NEW!)
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('CA (Chartered Accountant)', 'CHARTERED', 'PROFESSIONAL', 'Auditing', 'Mastery of taxation, auditing, and financial strategy.', '["Accounts Intro", "Direct Tax Laws", "InDirect Tax", "Audit Assurance", "Corp Laws", "Costing", "Ethics Final"]', '{"Aptitude": 95, "Business Strategy": 85}'),
('CMA', 'CHARTERED', 'PROFESSIONAL', 'Costing', 'Specialized management accounting and cost management.', '["Cost Analysis", "Strategic Tax", "Perf Mgmt", "Operation Audit", "Capital Budgeting", "Fin Reports", "Final Audit"]', '{"Aptitude": 90, "Business Strategy": 80}');

-- 🎨 Non-Professional (Creative)
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('UI/UX Design', 'CREATIVE', 'NON_PROFESSIONAL', 'Product', 'Design interface and user experience for apps.', '["Design Thinking", "Figma Basics", "User Journeys", "Wireframing", "Visual Design", "Prototyping", "Testing Lab"]', '{"Problem Solving": 80, "Aptitude": 75}'),
('Graphic Design', 'CREATIVE', 'NON_PROFESSIONAL', 'Visual', 'Creating visual content for branding and media.', '["Color Theory", "Typography", "Illustrator", "Photoshop", "Branding Basics", "Composition", "Portfolio"]', '{"Aptitude": 70, "Problem Solving": 60}');

-- 💻 IT / Digital (NEW!)
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('App Development', 'IT', 'NON_PROFESSIONAL', 'Mobile', 'Building high-performance native and cross-platform apps.', '["Mobile UI Basics", "React Native", "Swift/Kotlin", "API Integration", "State Mgmt", "App Store Opt", "Final App Launch"]', '{"Java Programming": 80, "Problem Solving": 75}'),
('Digital Marketing', 'IT', 'NON_PROFESSIONAL', 'SEO/Ads', 'Mastering web analytics, SEO, and social ad growth.', '["SEO Found", "Google Ads", "SMM Logic", "Content Strategy", "Email Automation", "PPC Mastery", "Growth Project"]', '{"Communication": 85, "Aptitude": 70}');

-- 🗣️ Soft Skills
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Public Speaking', 'SOFT_SKILLS', 'NON_PROFESSIONAL', 'Speech', 'Mastering the art of vocal and stage presence.', '["Vocal Variety", "Stage Presence", "Speech Structure", "Impromptu Skills", "Body Language", "Audience Engagement", "Final Speech"]', '{"Communication": 95, "Leadership": 80}'),
('Leadership Mastery', 'SOFT_SKILLS', 'NON_PROFESSIONAL', 'Exec', 'Developing emotional and strategic leadership skills.', '["Team Building", "Conflict Res", "Decision Making", "Strategic Vision", "Empathy training", "Global Mindset", "Final Audit"]', '{"Leadership": 90, "Communication": 85}');

-- 🎭 Arts & Humanities (NEW!)
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Content Writing', 'ARTS', 'NON_PROFESSIONAL', 'Creative', 'Mastering storytelling, copywriting, and narrative design.', '["Grammar Base", "Storytelling", "SEO Writing", "Copywriting", "Fiction Logic", "Editing Skills", "Final Article"]', '{"Communication": 90, "Aptitude": 70}'),
('Psychology Intro', 'ARTS', 'NON_PROFESSIONAL', 'Behavioral', 'Understanding human behavior and cognitive patterns.', '["Intro to Mind", "Cognitive Dev", "Social Psycho", "Abnormal Behavior", "Therapy Models", "Research Methods", "Case Study"]', '{"Problem Solving": 85, "Communication": 80}');

-- Assessments for ALL categories
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Engineering Entry Exam', 'TECHNICAL', 'Java Programming', '{"easy": [{"q":"Stateless service?","options":["Rest","Session"],"answer":0}], "medium": [], "hard": []}'),
('Medical Aptitude', 'TECHNICAL', 'Medical Science', '{"easy": [{"q":"Adult bones?","options":["200","206"],"answer":1}], "medium": [], "hard": []}'),
('Legal Reasoning Test', 'TECHNICAL', 'Legal Reasoning', '{"easy": [{"q":"High Court?","options":["State","Global"],"answer":0}], "medium": [], "hard": []}'),
('Strategic Thinking', 'TECHNICAL', 'Business Strategy', '{"easy": [{"q":"SWOT S stands for?","options":["Strengths","Success"],"answer":0}], "medium": [], "hard": []}'),
('Visual Aptitude', 'TECHNICAL', 'Problem Solving', '{"easy": [{"q":"Primary color?","options":["Red","Pink"],"answer":0}], "medium": [], "hard": []}'),
('Communication Benchmark', 'TECHNICAL', 'Communication', '{"easy": [{"q":"Eye contact?","options":["Good","Bad"],"answer":0}], "medium": [], "hard": []}');
