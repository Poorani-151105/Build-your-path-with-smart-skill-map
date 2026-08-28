-- FINAL MASTER SEED FOR SMART SKILL MAP (Phase 8 Complete)
USE smart_skill_map;

-- 1. Ensure Columns Exist
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS sub_domain VARCHAR(100);
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS courses_json JSON;
ALTER TABLE career_paths ADD COLUMN IF NOT EXISTS daily_track_json JSON;
ALTER TABLE assessments ADD COLUMN IF NOT EXISTS target_skill_name VARCHAR(100) DEFAULT 'General Skill';

-- 2. Wipe Previous Test Data
DELETE FROM career_paths;
DELETE FROM assessments;

-- 3. Career Paths (Medicine, Law, Business, Engineering)
INSERT INTO career_paths (title, sub_domain, description, requirement_json, daily_track_json) VALUES 
('Software Architect', 'Data Science', 'Master of AI-driven systems and scalable data engineering.', 
 '{"Java Programming": 90, "Problem Solving": 85}', 
 '["Python for Data Science", "Statistics Fundamentals", "Data Cleaning Techniques", "Supervised ML Models", "Deep Learning Intro", "Deployment with Docker", "Final ML Capstone"]'),
('Clinical Specialist', 'Cardiology', 'Expert and specialized practice in anatomical diagnosis.', 
 '{"Medical Science": 85, "Problem Solving": 75}', 
 '["Anatomy 101", "Physiology of Heart", "Cardio-vascular Diagnosis", "Medical Imaging Basics", "Pharmacology Intro", "Clinical Ethics", "Case Study Review"]'),
('Corporate Attorney', 'Legal Research', 'Executive legal advisor specializing in international trade.', 
 '{"Legal Reasoning": 90, "Communication": 90}', 
 '["Legal Systems Overview", "Contract Law Statutes", "Corporate Governance", "M&A Strategy", "Drafting Skills", "Negotiation Labs", "Mock Trial"]'),
('Investment Banker', 'Finance', 'Strategic capital management and financial asset analysis.', 
 '{"Business Strategy": 85, "Aptitude": 80}', 
 '["Financial Markets 101", "Equity Research Basics", "Valuation Modeling", "Risk Management", "Portfolio Strategies", "FinTech Trends", "Trading Simulation"]');

-- 4. Re-Seed Comprehensive Assessment Bank (Zero-Repeat Content)
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Medical Science Diagnostic', 'TECHNICAL', 'Medical Science', '{
    "easy": [
        {"q":"Adult bones?","options":["200","206"],"answer":1},
        {"q":"Largest organ?","options":["Skin","Heart"],"answer":0},
        {"q":"Chambers in heart?","options":["2","4"],"answer":1},
        {"q":"Eye vitamin?","options":["A","C"],"answer":0},
        {"q":"Blood pH?","options":["6.5","7.4"],"answer":1}
    ],
    "medium": [
        {"q":"Kidney unit?","options":["Neuron","Nephron"],"answer":1},
        {"q":"O2 carrier?","options":["Plasma","Hema"],"answer":1},
        {"q":"BP unit?","options":["mmHg","Pa"],"answer":0},
        {"q":"Stomach acid?","options":["HCl","H2SO4"],"answer":0},
        {"q":"Brain lobes?","options":["4","6"],"answer":0}
    ],
    "hard": [
        {"q":"Pacemaker?","options":["SA Node","AV"],"answer":0},
        {"q":"Master gland?","options":["Pituitary","Thyroid"],"answer":0},
        {"q":"Insulin by?","options":["Liver","Pancreas"],"answer":1},
        {"q":"Mitosis phases?","options":["4","5"],"answer":0},
        {"q":"Red cell life?","options":["120d","60d"],"answer":0}
    ]
}'),
('Computer Science Core', 'TECHNICAL', 'Java Programming', '{
    "easy": [
        {"q":"LIFO Structure?","options":["Queue","Stack"],"answer":1},
        {"q":"HTML stands for?","options":["HyperText","HighText"],"answer":0},
        {"q":"Bit value?","options":["0/1","Byte"],"answer":0},
        {"q":"Main function?","options":["Entry","Exit"],"answer":0},
        {"q":"RAM type?","options":["Volatile","Fixed"],"answer":0}
    ],
    "medium": [
        {"q":"Binary Search?","options":["O(n)","O(log n)"],"answer":1},
        {"q":"Primary Key?","options":["Unique","Duplicate"],"answer":0},
        {"q":"HTTP Port?","options":["80","443"],"answer":0},
        {"q":"CSS full form?","options":["Cascading Style","Casual"],"answer":0},
        {"q":"Garbage Collection?","options":["Java","C"],"answer":0}
    ],
    "hard": [
        {"q":"CAP Theorem?","options":["Consistency","Capacity"],"answer":0},
        {"q":"ACID P missing?","options":["Isolation","Performance"],"answer":1},
        {"q":"Logic NOT?","options":["Inverter","AND"],"answer":0},
        {"q":"Threads share?","options":["Heap","Stack"],"answer":0},
        {"q":"Binary 101?","options":["5","3"],"answer":0}
    ]
}'),
('Corporate Law & Ethics', 'TECHNICAL', 'Legal Reasoning', '{
    "easy": [
        {"q":"Highest Court?","options":["High","Supreme"],"answer":1},
        {"q":"Constitution Day?","options":["Nov 26","Jan 26"],"answer":0},
        {"q":"PM Age?","options":["25","35"],"answer":0},
        {"q":"RTE type?","options":["Legal","Fundamental"],"answer":1},
        {"q":"IPC full?","options":["Indian Penal","Internal"],"answer":0}
    ],
    "medium": [
        {"q":"Father of Const?","options":["Nehru","Ambedkar"],"answer":1},
        {"q":"PIL full form?","options":["Public Interest","Private"],"answer":0},
        {"q":"Prez term?","options":["4y","5y"],"answer":1},
        {"q":"Zero Hour?","options":["Parliament","Court"],"answer":0},
        {"q":"Trial type?","options":["Civil","Armed"],"answer":0}
    ],
    "hard": [
        {"q":"Habeas Corpus?","options":["Produce body","Command"],"answer":0},
        {"q":"Upper House?","options":["Lok","Rajya"],"answer":1},
        {"q":"Magna Carta date?","options":["1215","1512"],"answer":0},
        {"q":"Writ count?","options":["5","7"],"answer":0},
        {"q":"Judicial Review?","options":["Check Laws","Check People"],"answer":0}
    ]
}'),
('MBA Finance & Strategy', 'TECHNICAL', 'Business Strategy', '{
    "easy": [
        {"q":"Unicorn value?","options":["$10M","$1B"],"answer":1},
        {"q":"ROI?","options":["Return on Invest","Interest"],"answer":0},
        {"q":"CEO?","options":["Chief Exec","Central"],"answer":0},
        {"q":"Marketing goal?","options":["Sales","Value Exchange"],"answer":1},
        {"q":"Audit type?","options":["Financial","Physics"],"answer":0}
    ],
    "medium": [
        {"q":"SWOT T stands for?","options":["Trends","Threats"],"answer":1},
        {"q":"Father of Mgmt?","options":["Drucker","Ford"],"answer":0},
        {"q":"NIFTY is?","options":["Index","Stock"],"answer":0},
        {"q":"B2B?","options":["Business 2 Business","2 Basic"],"answer":0},
        {"q":"Bear Market?","options":["Down","Up"],"answer":0}
    ],
    "hard": [
        {"q":"P/E Ratio?","options":["Price/Earn","Perform"],"answer":0},
        {"q":"Blue Ocean?","options":["New market","Compete"],"answer":0},
        {"q":"VC is for?","options":["Startups","Banks"],"answer":0},
        {"q":"Sunk Cost?","options":["Irretrievable","Profit"],"answer":0},
        {"q":"EBITDA?","options":["Earnings","Expenses"],"answer":0}
    ]
}');
