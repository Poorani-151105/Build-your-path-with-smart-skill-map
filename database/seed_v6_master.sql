-- MASTER SEED FOR SMART SKILL MAP (Phase 6 Final)
USE smart_skill_map;

-- 1. Ensure schema is updated
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS sub_domain VARCHAR(100);

-- 2. Clear old mapping data
DELETE FROM career_paths;
DELETE FROM assessments;

-- 3. Career Paths (Medicine, Law, Business, Engineering)
INSERT INTO career_paths (title, sub_domain, description, requirement_json, roadmap_json) VALUES 
('Software Architect', 'Computer Science', 'Master of system design and high-level engineering.', 
 '{"Java Programming": 90, "Problem Solving": 85}', '[]'),
('Clinical Specialist', 'Cardiology', 'Expert and specialized medical practice.', 
 '{"Medical Science": 85, "Problem Solving": 75}', '[]'),
('Corporate Attorney', 'Mergers & Acquisitions', 'Strategic legal advisor for global enterprises.', 
 '{"Legal Reasoning": 90, "Communication": 90}', '[]'),
('Investment Banker', 'Finance', 'High-stakes financial analysis and capital management.', 
 '{"Business Strategy": 85, "Aptitude": 80}', '[]');

-- 4. Re-Seed All Assessments (Dynamic Mapping enabled)
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('CSE Computer Systems', 'TECHNICAL', 'Java Programming', '{
    "easy": [{"q":"LIFO Structure?","options":["Queue","Stack"],"answer":1},{"q":"HTML stands for?","options":["HyperText","HighText"],"answer":0}],
    "medium": [{"q":"Binary Search?","options":["O(n)","O(log n)"],"answer":1}],
    "hard": [{"q":"CAP Theorem?","options":["Consistency","Capacity"],"answer":0}]
}'),
('MBBS Anatomy Hub', 'TECHNICAL', 'Medical Science', '{
    "easy": [{"q":"Adult bones?","options":["200","206"],"answer":1},{"q":"Largest organ?","options":["Skin","Heart"],"answer":0}],
    "medium": [{"q":"Kidney unit?","options":["Neuron","Nephron"],"answer":1}],
    "hard": [{"q":"Pacemaker?","options":["SA Node","AV"],"answer":0}]
}'),
('Corporate Law Finals', 'TECHNICAL', 'Legal Reasoning', '{
    "easy": [{"q":"Highest Court?","options":["High","Supreme"],"answer":1},{"q":"Constitution Day?","options":["Nov 26","Jan 26"],"answer":0}],
    "medium": [{"q":"PIL full form?","options":["Public Interest","Private"],"answer":0}],
    "hard": [{"q":"Habeas Corpus?","options":["Produce body","Command"],"answer":0}]
}'),
('MBA Finance Strategy', 'TECHNICAL', 'Business Strategy', '{
    "easy": [{"q":"Unicorn value?","options":["$10M","$1B"],"answer":1},{"q":"ROI?","options":["Return on Invest","Interest"],"answer":0}],
    "medium": [{"q":"SWOT T stands for?","options":["Trends","Threats"],"answer":1}],
    "hard": [{"q":"P/E Ratio?","options":["Price/Earn","Perform"],"answer":0}]
}');
