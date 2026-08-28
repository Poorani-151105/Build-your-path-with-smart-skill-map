-- FINAL MASTER RESET SCRIPT - Smart Skill Map
-- Use this one script to fix all column/table errors across all domains.

SET FOREIGN_KEY_CHECKS = 0; -- REQUIRED for dropping tables with dependencies
USE smartskillmap;

-- 1. CLEAN SLATE - DROP ALL DATA TABLES
-- We keep the 'users' table to preserve logins, but clear everything else.
DROP TABLE IF EXISTS test_results;
DROP TABLE IF EXISTS user_assessments;
DROP TABLE IF EXISTS user_skills;
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS assessment_results;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS assessments;
DROP TABLE IF EXISTS career_paths;

-- 2. REBUILD USERS (Ensure Columns Exist)
-- We skip ALTER IF NOT EXISTS for broad compatibility.
-- If you see an error about enrolled_career_id, please run the following line manually:
-- ALTER TABLE users ADD COLUMN enrolled_career_id BIGINT;
-- ALTER TABLE users ADD COLUMN progress_json TEXT;

-- 3. REBUILD CORE TABLES
CREATE TABLE career_paths (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    sub_domain VARCHAR(255),
    daily_track_json TEXT, 
    requirement_json TEXT, 
    path_type VARCHAR(255) DEFAULT 'PROFESSIONAL',
    domain_category VARCHAR(255) DEFAULT 'GENERAL'
);

CREATE TABLE assessments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    target_skill_name VARCHAR(255),
    questions_json TEXT 
);

-- 4. SEED ALL 36 CAREER PATHS
-- Professional: ENGINEERING
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Computer Science Engineering', 'ENGINEERING', 'PROFESSIONAL', 'Software Sys', 'Core foundation of software and hardware systems.', '["Logic & Flow", "OS Basics", "Networking Fundamentals", "Software Engineering Principles", "Cloud Deployment", "Security Best Practices", "Project Phase"]', '{"Java Programming": 85, "Problem Solving": 80}'),
('Data Science', 'ENGINEERING', 'PROFESSIONAL', 'Analytics', 'Extracting insights from complex data sets.', '["Python for Data", "Statistical Analysis", "Data Cleaning", "Visualization Tools", "Predictive Modeling", "Big Data Intro", "Discovery Lab"]', '{"Aptitude": 90, "Problem Solving": 85}'),
('Artificial Intelligence', 'ENGINEERING', 'PROFESSIONAL', 'ML/DL', 'Developing intelligent systems and algorithms.', '["Linear Algebra", "ML Fundamentals", "Neural Networks", "NLP Basics", "Computer Vision", "AI Ethics", "Bot Challenge"]', '{"Problem Solving": 95, "Aptitude": 90}'),
('Cyber Security', 'ENGINEERING', 'PROFESSIONAL', 'Infosec', 'Protecting networks and systems from digital attacks.', '["Network Security", "Ethical Hacking", "Cryptography", "Risk Management", "Compliance", "Incident Response", "CTF Competition"]', '{"Problem Solving": 85, "Aptitude": 80}'),
('Mechanical Engineering', 'ENGINEERING', 'PROFESSIONAL', 'Mech', 'Designing and manufacturing machines and tools.', '["CAD Design", "Thermodynamics", "Statics", "Fluid Mechanics", "Material Science", "Automation", "Mech Project"]', '{"Aptitude": 85}'),
('Civil Engineering', 'ENGINEERING', 'PROFESSIONAL', 'Civil', 'Designing buildings, bridges and infrastructure.', '["Surveying", "Structural Design", "Concrete Tech", "Geotechnical", "Environmental", "Planning", "Civil Lab"]', '{"Aptitude": 80}'),
('Electronics & Comm', 'ENGINEERING', 'PROFESSIONAL', 'ECE', 'Communication systems and electronic hardware.', '["Digital Logic", "Signal Processing", "Solid State", "Antennas", "Microcontrollers", "IoT", "ECE Project"]', '{"Aptitude": 85}');

-- Professional: MEDICAL
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('MBBS', 'MEDICAL', 'PROFESSIONAL', 'General', 'Bachelor of Medicine and Bachelor of Surgery.', '["Anatomy", "Physiology", "Biochemistry", "Pathology", "Microbiology", "Pharmacology", "Clinical Ward"]', '{"Medical Science": 90}'),
('BDS Dental', 'MEDICAL', 'PROFESSIONAL', 'Dental', 'Expertise in oral and dental medical care.', '["Dental Anatomy", "Oral Pathology", "Periodontics", "Orthodontics", "Oral Surgery", "Clinical Lab"]', '{"Medical Science": 80}'),
('Pharmacy', 'MEDICAL', 'PROFESSIONAL', 'Pharma', 'Development and management of pharmaceutical drugs.', '["Pharmaceutics", "Medicinal Chemistry", "Pharmacognosy", "Biotoxicity", "Clinical Pharmacy", "Regulatory Affairs"]', '{"Medical Science": 85}'),
('Nursing', 'MEDICAL', 'PROFESSIONAL', 'Nursing', 'Professional nursing care and clinical assistance.', '["Patient Care", "Surgical Nursing", "Pediatrics", "Mental Health", "Midwifery", "Community Health", "Final Ward"]', '{"Medical Science": 75}');

-- Professional: LAW
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Corporate Law', 'LAW', 'PROFESSIONAL', 'M&A', 'Legal mastery of business transactions and mergers.', '["Legal Systems", "Contract Law", "Corporate Governance", "Trade Regulations", "Drafting", "Arbitration", "M&A Case"]', '{"Legal Reasoning": 95}'),
('Criminal Law', 'LAW', 'PROFESSIONAL', 'Criminal', 'Representing cases involving criminal offenses.', '["Penal Code", "Criminal Procedure", "Evidence Act", "Forensic Law", "Victimology", "Cross Exam", "Mock Trial"]', '{"Legal Reasoning": 85}'),
('International Law', 'LAW', 'PROFESSIONAL', 'Global', 'Legal relations between nations and global entities.', '["UN Charters", "Diplomatic Law", "Sea Law", "Human Rights", "Space Law", "Global Trade", "Final Moot"]', '{"Legal Reasoning": 90}');

-- Professional: BUSINESS
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Marketing MBA', 'BUSINESS', 'PROFESSIONAL', 'Marketing', 'Mastering market research and brand growth.', '["Consumer Behavior", "Digital Strategy", "Market Research", "Brand Mgmt", "Supply Chain", "Global Biz", "Final Pitch"]', '{"Business Strategy": 90}'),
('Finance MBA', 'BUSINESS', 'PROFESSIONAL', 'Finance', 'High-end financial management and investments.', '["Fin Analysis", "Derivatives", "Mergers", "Portfolio Mgmt", "Risk", "Investment Pitch", "Audit Final"]', '{"Business Strategy": 85}'),
('HR Management', 'BUSINESS', 'PROFESSIONAL', 'HR', 'Managing talent and organizational growth.', '["Talent Hunt", "Payroll Logic", "Labor Laws", "Org Behavior", "Training", "Appraisals", "Final Policy"]', '{"Business Strategy": 80}');

-- Professional: CHARTERED
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('CA (Accountant)', 'CHARTERED', 'PROFESSIONAL', 'Audit', 'Mastery of taxation and financial auditing.', '["Accounts", "Direct Tax", "Indirect Tax", "Audit", "Costing", "Corp Laws", "Ethics Final"]', '{"Aptitude": 95}'),
('CMA', 'CHARTERED', 'PROFESSIONAL', 'Cost', 'Management accounting and cost management.', '["Cost Analysis", "Strategic Tax", "Perf Mgmt", "Cap Budgeting", "Audit", "Fin Reports", "Ethics"]', '{"Aptitude": 90}');

-- Skill-Based: CREATIVE
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('UI/UX Design', 'CREATIVE', 'NON_PROFESSIONAL', 'Product', 'Design interface and user experience.', '["Design Thinking", "Figma Basics", "User Journeys", "Wireframing", "Visual Design", "Prototyping", "Testing"]', '{"Problem Solving": 80}'),
('Graphic Design', 'CREATIVE', 'NON_PROFESSIONAL', 'Visual', 'Creating visual content for branding.', '["Color Theory", "Typography", "Illustrator", "Photoshop", "Composition", "Branding", "Portfolio"]', '{"Aptitude": 75}'),
('Animation', 'CREATIVE', 'NON_PROFESSIONAL', '3D', '3D modeling and motion graphics.', '["Modeling", "Texturing", "Rigging", "Animation", "Lighting", "Rendering", "Showreel"]', '{"Problem Solving": 85}');

-- Skill-Based: IT SKILLS
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('App Development', 'IT', 'NON_PROFESSIONAL', 'Mobile', 'Building mobile applications.', '["Mobile UI", "React Native", "Swift", "API", "State", "Store Opt", "App Launch"]', '{"Java Programming": 80}'),
('Digital Marketing', 'IT', 'NON_PROFESSIONAL', 'SEO', 'Web analytics and social ad growth.', '["SEO", "Google Ads", "SMM", "Content", "PPC", "Automation", "Growth Lab"]', '{"Communication": 85}');

-- Skill-Based: SOFT SKILLS
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Public Speaking', 'SOFT_SKILLS', 'NON_PROFESSIONAL', 'Speech', 'Mastery of stage presence and speech.', '["Vocal Variety", "Body Language", "Speech Structure", "Impromptu", "Confidence", "Audience", "Final Speech"]', '{"Communication": 95}'),
('Leadership Mastery', 'SOFT_SKILLS', 'NON_PROFESSIONAL', 'Exec', 'Developing strategic leadership skills.', '["Teambuilding", "Decision Making", "Vision", "Empathy", "Conflict", "Ethics", "Case Study"]', '{"Leadership": 90}');

-- Skill-Based: ARTS & HUMANITIES
INSERT INTO career_paths (title, domain_category, path_type, sub_domain, description, daily_track_json, requirement_json) VALUES 
('Psychology', 'ARTS', 'NON_PROFESSIONAL', 'Behavior', 'Understanding the human mind and social behavior.', '["Foundations of Psych", "Mind & Body", "Developmental Psych", "Social Behavior", "Cognitive Lab", "Research Methods", "Case Analysis"]', '{"Aptitude": 85}'),
('Journalism', 'ARTS', 'NON_PROFESSIONAL', 'Media', 'Reporting, writing, and global media studies.', '["News Writing", "Ethical Reporting", "Digital Media", "Investigative Skills", "Social Media Journalism", "Global Affairs", "Final Report"]', '{"Communication": 90}'),
('Sociology', 'ARTS', 'NON_PROFESSIONAL', 'Society', 'Analyzing social structures and community issues.', '["Social Structures", "Culture & Identity", "Modern Conflicts", "Demographics", "Social Theory", "Field Work", "Civic Final"]', '{"Aptitude": 80}');

-- 5. SEED COURSE-SPECIFIC EXAMS (1-TO-1 MAPPING)
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Computer Science Engineering', 'ENGINEERING', 'Computer Science', '{
    "easy": [
        {"q":"What is the core protocol of the web?","options":["HTTP","SMTP","FTP"],"answer":0},
        {"q":"What does HTML stand for?","options":["HyperText Markup Language","HighText Machine Language","HyperLink Mechanism"],"answer":0},
        {"q":"Which of these is a non-volatile memory?","options":["RAM","Cache","HDD"],"answer":2},
        {"q":"What is the primary function of an Operating System?","options":["Resource Management","Web Browsing","Emailing"],"answer":0}
    ],
    "medium": [
        {"q":"What does OOP stand for?","options":["Order of Programming","Object-Oriented Programming","Out Of Print"],"answer":1},
        {"q":"Concept of LIFO is used in?","options":["Stack","Queue","Linked List"],"answer":0},
        {"q":"What is a deadlock in OS?","options":["Infinite loop","Process waiting for resource held by another","Server crash"],"answer":1},
        {"q":"Which protocol is used to fetch emails?","options":["SMTP","POP3","FTP"],"answer":1}
    ],
    "hard": [
        {"q":"Time complexity of binary search?","options":["O(1)","O(n)","O(log n)"],"answer":2},
        {"q":"Which scheduling algorithm leads to starvation?","options":["Round Robin","First Come First Serve","Priority Scheduling"],"answer":2},
        {"q":"Primary key in a database must be?","options":["Unique","Non-null","Both"],"answer":2},
        {"q":"What is a microkernel?","options":["Small OS core","Peripheral driver","Compiler part"],"answer":0}
    ]
}'),
('Data Science', 'ENGINEERING', 'Data Analytics', '{
    "easy": [
        {"q":"Which language is most used for Data Science?","options":["C++","Python","HTML"],"answer":1},
        {"q":"What is a CSV file?","options":["Comma Separated Values","Code System View","Central Skill Volume"],"answer":0},
        {"q":"What is an outlier?","options":["Central value","An extreme data point","Average value"],"answer":1},
        {"q":"Basic unit of a NumPy array?","options":["Element","List","Tuple"],"answer":0}
    ],
    "medium": [
        {"q":"What is Pandas used for?","options":["Web design","Data manipulation","Networking"],"answer":1},
        {"q":"What is supervised learning?","options":["Labeled data","Unlabeled data","Real-time feedback"],"answer":0},
        {"q":"What is a heat map?","options":["Graphical data representation","Weather tool","Coding pattern"],"answer":0},
        {"q":"What does SQL stand for?","options":["Structured Query Language","System Quality Logic","Standard Query List"],"answer":0}
    ],
    "hard": [
        {"q":"What does a p-value indicate?","options":["Statistical significance","Probability of true null","Data purity"],"answer":0},
        {"q":"What is k-fold cross-validation?","options":["Model validation technique","Data sorting","Type of join"],"answer":0},
        {"q":"Overfitting occurs when?","options":["Model is too simple","Model learns noise instead of signal","Data is too clean"],"answer":1},
        {"q":"What is the purpose of PCA?","options":["Data increase","Dimensionality reduction","Sorting"],"answer":1}
    ]
}'),
('Artificial Intelligence', 'ENGINEERING', 'AI Algorithms', '{
    "easy": [
        {"q":"What does AI stand for?","options":["Auto Intel","Artificial Intelligence","Array Index"],"answer":1},
        {"q":"Basic component of a Neural Network?","options":["Neuron","Bit","Pixel"],"answer":0},
        {"q":"Who is the father of AI?","options":["John McCarthy","Alan Turing","Elon Musk"],"answer":0},
        {"q":"What is a chatbot?","options":["Robot dog","AI that talks","Search engine"],"answer":1}
    ],
    "medium": [
        {"q":"Which type of network mimics the human brain?","options":["Neural Network","VPN","LAN"],"answer":0},
        {"q":"What is Machine Learning?","options":["Manual coding","Ability to learn without explicit programming","Robot building"],"answer":1},
        {"q":"What is Natural Language Processing?","options":["Parsing HTML","Understanding human speech/text","Database sorting"],"answer":1},
        {"q":"What is Turing Test used for?","options":["Hardware speed","Intelligence level","Security check"],"answer":1}
    ],
    "hard": [
        {"q":"What is backpropagation used for?","options":["Database rollback","Training weight adjustment","Sorting arrays"],"answer":1},
        {"q":"Definition of Deep Learning?","options":["Deep database","Neural networks with many layers","Hard coding"],"answer":1},
        {"q":"What is a Markov chain?","options":["Data structure","Stochastic model for sequential events","Security protocol"],"answer":1},
        {"q":"Reinforcement learning is based on?","options":["Labels","Rewards/Penalties","Manual input"],"answer":1}
    ]
}'),
('Cyber Security', 'ENGINEERING', 'InfoSec', '{
    "easy": [
        {"q":"What is a firewall?","options":["Network security system","Antivirus","Cooling fan"],"answer":0},
        {"q":"What is a strong password?","options":["123456","Complex mix of chars","Your name"],"answer":1},
        {"q":"What is Phishing?","options":["Fishing with magnets","Email scam to steal data","Network speed test"],"answer":1},
        {"q":"What does HTTPS add?","options":["Security/Encryption","Speed","Images"],"answer":0}
    ],
    "medium": [
        {"q":"What does DDoS stand for?","options":["Distributed Denial of Service","Data Drop","Direct Download"],"answer":0},
        {"q":"What is a VPN?","options":["Virtual Private Network","Video Port Name","Visual Path Note"],"answer":0},
        {"q":"What is Malware?","options":["Good software","Malicious software","Hardware driver"],"answer":1},
        {"q":"Two-factor authentication involves?","options":["One password","Two layers of security","Biometrics only"],"answer":1}
    ],
    "hard": [
        {"q":"Which is a symmetric encryption algorithm?","options":["RSA","AES","SHA-256"],"answer":1},
        {"q":"What is a SQL injection?","options":["Database update","Code injection attacking DB","Network boost"],"answer":1},
        {"q":"What is the CIA triad?","options":["Gov agency","Confidentiality, Integrity, Availability","Computer Intel Access"],"answer":1},
        {"q":"Zero Trust Architecture means?","options":["Trust no one by default","Trust everyone on LAN","No security"],"answer":0}
    ]
}'),
('Mechanical Engineering', 'ENGINEERING', 'Mechanics', '{
    "easy": [
        {"q":"What measures force?","options":["Newton","Joule","Watt"],"answer":0},
        {"q":"Unit of power?","options":["Volt","Watt","Ampere"],"answer":1},
        {"q":"Simple machine for lifting?","options":["Lever","Monitor","Keyboard"],"answer":0},
        {"q":"Friction acts in which direction?","options":["Same as motion","Opposite to motion","Perpendicular"],"answer":1}
    ],
    "medium": [
        {"q":"What is thermodynamics?","options":["Study of heat/energy","Study of fluid flow","Study of light"],"answer":0},
        {"q":"Ratio of stress to strain?","options":["Young''s Modulus","Inertia","Viscosity"],"answer":0},
        {"q":"What is a CNC machine?","options":["Computer Numerical Control","Central Network Code","Circle Net Center"],"answer":0},
        {"q":"Pascal''s Law relates to?","options":["Solids","Fluids","Light"],"answer":1}
    ],
    "hard": [
        {"q":"What is Fourier''s Law related to?","options":["Heat conduction","Fluid dynamics","Elasticity"],"answer":0},
        {"q":"What is the Carnot cycle?","options":["Bike route","Idealized thermodynamic cycle","Weather pattern"],"answer":1},
        {"q":"Bernoulli''s principle relates?","options":["Pressure/Flow speed","Heat/Sound","Mass/Light"],"answer":0},
        {"q":"What is Poisson''s ratio?","options":["Deformation ratio","Friction factor","Heat capacity"],"answer":0}
    ]
}'),
('Civil Engineering', 'ENGINEERING', 'Structural Design', '{
    "easy": [
        {"q":"What is cement mixed with to form concrete?","options":["Water, Sand, Gravel","Just water","Oil"],"answer":0},
        {"q":"Standard brick size?","options":["19x9x9 cm","10x10x10 cm","25x25x25 cm"],"answer":0},
        {"q":"Tool for measuring distances?","options":["Tape","Screwdriver","Hammer"],"answer":0},
        {"q":"What is surveying?","options":["Mapping land","Painting walls","Fixing pipes"],"answer":0}
    ],
    "medium": [
        {"q":"What does CAD stand for?","options":["Computer Aided Design","Civil Arch Design","Control And Draft"],"answer":0},
        {"q":"What is a shear wall?","options":["Internal wall for lateral loads","Decorative wall","External glass"],"answer":0},
        {"q":"Purpose of a foundation?","options":["Decoration","Transfer load to soil","Keep cool"],"answer":1},
        {"q":"What is GPS used for in civil?","options":["Location/Mapping","Mixing concrete","Hiring"],"answer":0}
    ],
    "hard": [
        {"q":"bending moment of a cantilever beam?","options":["W*L","W*L^2/2","Uniform"],"answer":1},
        {"q":"What is prestressed concrete?","options":["Stretched before load","Extra thick","Colored"],"answer":0},
        {"q":"Modulus of elasticity of steel?","options":["200 GPa","50 GPa","10 GPa"],"answer":0},
        {"q":"What is Slump Test for?","options":["Soil density","Concrete workability","Water purity"],"answer":1}
    ]
}'),
('Electronics & Comm', 'ENGINEERING', 'Electronics', '{
    "easy": [
        {"q":"Unit of electrical resistance?","options":["Ohm","Volt","Ampere"],"answer":0},
        {"q":"Device that stores charge?","options":["Resistor","Capacitor","Inductor"],"answer":1},
        {"q":"What does AC stand for?","options":["Active Current","Alternating Current","Auto Code"],"answer":1},
        {"q":"Which of these is a semiconductor?","options":["Iron","Silicon","Plastic"],"answer":1}
    ],
    "medium": [
        {"q":"What does an alternator produce?","options":["DC","AC","Both"],"answer":1},
        {"q":"Function of a diode?","options":["Amplify signal","Allow current in one direction","Store data"],"answer":1},
        {"q":"What is V=IR?","options":["Ohm''s Law","Newton''s Law","Faraday''s Law"],"answer":0},
        {"q":"What is a PCB?","options":["Printed Circuit Board","Personal Card Bank","Power Control Box"],"answer":0}
    ],
    "hard": [
        {"q":"Logic gate returns 1 only if all inputs are 1?","options":["OR","AND","XOR"],"answer":1},
        {"q":"What is Nyquist rate?","options":["Speed of light","Sampling frequency","Battery life"],"answer":1},
        {"q":"Difference between BJT and MOSFET?","options":["Both same","Current vs Voltage controlled","Color"],"answer":1},
        {"q":"What is a PLL?","options":["Power Line Loop","Phase-Locked Loop","Primary Logic Link"],"answer":1}
    ]
}'),
('MBBS', 'MEDICAL', 'Medicine', '{
    "easy": [
        {"q":"Normal human body temperature?","options":["35 C","37 C","40 C"],"answer":1},
        {"q":"How many chambers in high heart?","options":["2","4","3"],"answer":1},
        {"q":"Main function of WBCs?","options":["Oxygen transport","Immunity","Blood clotting"],"answer":1},
        {"q":"Which organ filters blood?","options":["Heart","Kidney","Liver"],"answer":1}
    ],
    "medium": [
        {"q":"Which organ produces insulin?","options":["Liver","Pancreas","Kidney"],"answer":1},
        {"q":"Definition of Hypertension?","options":["Low BP","High BP","Low Suger"],"answer":1},
        {"q":"What is Myopia?","options":["Nearsightedness","Farsightedness","Color blind"],"answer":0},
        {"q":"What does CPR stand for?","options":["Cardiopulmonary Resuscitation","Central Pulse Recovery","Cardio Power Rate"],"answer":0}
    ],
    "hard": [
        {"q":"What condition causes demyelination?","options":["Multiple Sclerosis","Alzheimer''s","Lupus"],"answer":0},
        {"q":"What is Glaucoma?","options":["Eye nerve damage","Bone break","Skin rash"],"answer":0},
        {"q":"Vitamin K deficiency leads to?","options":["Night blindness","Poor blood clotting","Scurvy"],"answer":1},
        {"q":"Role of Hemoglobin?","options":["Carry Oxygen","Digestion","Movement"],"answer":0}
    ]
}'),
('BDS Dental', 'MEDICAL', 'Dentistry', '{
    "easy": [
        {"q":"How many permanent teeth do humans have?","options":["30","32","34"],"answer":1},
        {"q":"What is a cavity?","options":["Tooth decay/hole","Strong tooth","Tooth brush"],"answer":0},
        {"q":"Best way to prevent tooth decay?","options":["Brushing/Flossing","Drinking soda","Eating sugar"],"answer":0},
        {"q":"Which part of tooth is visible?","options":["Root","Crown","Nerve"],"answer":1}
    ],
    "medium": [
        {"q":"What is the hardest tissue in the body?","options":["Bone","Enamel","Dentin"],"answer":1},
        {"q":"What is Gingivitis?","options":["Gum inflammation","Tooth ache","Dry mouth"],"answer":0},
        {"q":"What does a root canal treat?","options":["Nerve infection","Yellow teeth","Bad breath"],"answer":0},
        {"q":"What is Plaque?","options":["Sticky bacteria film","Calcium layer","Tooth gem"],"answer":0}
    ],
    "hard": [
        {"q":"Which bacteria is responsible for caries?","options":["E. coli","S. mutans","H. pylori"],"answer":1},
        {"q":"What is an impacted tooth?","options":["Tooth stuck under gum","Broken tooth","Extra tooth"],"answer":0},
        {"q":"What is Orthodontics?","options":["Straightening teeth","Extracting teeth","Dental surgery"],"answer":0},
        {"q":"Periodontitis affects?","options":["Supporting structures of teeth","Enamel only","Tongue"],"answer":0}
    ]
}'),
('Pharmacy', 'MEDICAL', 'Pharmacology', '{
    "easy": [
        {"q":"What is Paracetamol used for?","options":["Fever reduction","Antibiotic","BP control"],"answer":0},
        {"q":"Route for injection?","options":["Oral","Intravenous","Topical"],"answer":1},
        {"q":"What is a prescription?","options":["Legal order for meds","A bill","A map"],"answer":0},
        {"q":"What is an OTC drug?","options":["Over The Counter","Only Technical Code","Online Track Card"],"answer":0}
    ],
    "medium": [
        {"q":"What does bid mean on a prescription?","options":["Once daily","Twice daily","As needed"],"answer":1},
        {"q":"What is an antibiotic?","options":["Kills bacteria","Kills virus","Heals cuts"],"answer":0},
        {"q":"Pharmacokinetics refers to?","options":["What body does to drug","What drug does to body","Drug price"],"answer":0},
        {"q":"Half-life of a drug is?","options":["Time to reach 50% concentration","Exp date","Time to work"],"answer":0}
    ],
    "hard": [
        {"q":"Which of these is an ACE inhibitor?","options":["Amlodipine","Lisinopril","Metoprolol"],"answer":1},
        {"q":"What is Bioavailability?","options":["Proportion of drug reaching systemic circulation","Shelf life","Eco-friendly packaging"],"answer":0},
        {"q":"Adverse Drug Reaction (ADR) means?","options":["Unintended harmful effect","Correct effect","Placebo effect"],"answer":0},
        {"q":"First-pass metabolism happens in?","options":["Heart","Liver","Kidney"],"answer":1}
    ]
}'),
('Nursing', 'MEDICAL', 'Nursing Care', '{
    "easy": [
        {"q":"Normal resting heart rate?","options":["60-100","30-50","120-150"],"answer":0},
        {"q":"Basic hygiene for nurses?","options":["Handwashing","Checking phone","Uniform"],"answer":0},
        {"q":"Normal BP reading?","options":["120/80","180/100","90/60"],"answer":0},
        {"q":"What is a stethoscope used for?","options":["Listening to heart/lungs","Checking temp","Blood sugar"],"answer":0}
    ],
    "medium": [
        {"q":"What is triage?","options":["Billing","Prioritizing care","Discharge"],"answer":1},
        {"q":"Definition of Patient Autonomy?","options":["Patient right to decide","Nurse decides","Doctor decides"],"answer":0},
        {"q":"What is a catheter?","options":["Tube for fluids/urine","Surgical knife","Medicine bottle"],"answer":0},
        {"q":"Standard precautions apply to?","options":["All patients","Infected only","Elderly only"],"answer":0}
    ],
    "hard": [
        {"q":"Which IV fluid is isotonic?","options":["0.9% NaCl","3% NaCl","D5W"],"answer":0},
        {"q":"Normal oxygen saturation?","options":["95-100%","70-80%","40-50%"],"answer":0},
        {"q":"What is Anaphylaxis?","options":["Severe allergic reaction","Headache","Sleepiness"],"answer":0},
        {"q":"Fowler''s position is?","options":["Sitting upright","Lying flat","On side"],"answer":0}
    ]
}'),
('Corporate Law', 'LAW', 'Corporate Law', '{
    "easy": [
        {"q":"What is a contract?","options":["A legally binding agreement","A casual promise","A lawsuit"],"answer":0},
        {"q":"What is an IPO?","options":["Initial Public Offering","Internal Power Order","Item Price Option"],"answer":0},
        {"q":"Who owns a company?","options":["Shareholders","Managers","Employees"],"answer":0},
        {"q":"Goal of corporate governance?","options":["Accountability/Fairness","Revenue only","Legal loops"],"answer":0}
    ],
    "medium": [
        {"q":"What does LLC stand for?","options":["Limited Liability Company","Legal Case","Lawful Code"],"answer":0},
        {"q":"What is a Merger?","options":["Two companies joining","Company closing","Selling assets"],"answer":0},
        {"q":"What is Insider Trading?","options":["Legal trading","Illegal trading using non-public info","Stock analysis"],"answer":1},
        {"q":"Board of Directors role?","options":["Day-to-day operations","Strategic oversight","Accounting only"],"answer":1}
    ],
    "hard": [
        {"q":"What is piercing the corporate veil?","options":["Holding shareholders personally liable","Filing bankruptcy","Liquidating assets"],"answer":0},
        {"q":"Hostile Takeover means?","options":["Acquisition against board wishes","Friendly deal","Government buyout"],"answer":0},
        {"q":"Due Diligence is?","options":["Background check/Verification","Paying taxes","Hiring lawyers"],"answer":0},
        {"q":"Antitrust laws prevent?","options":["Monopolies","Small biz","Innovation"],"answer":0}
    ]
}'),
('Criminal Law', 'LAW', 'Criminal Law', '{
    "easy": [
        {"q":"Guilt beyond reasonable doubt?","options":["High standard of proof","Slight suspicion","51% sure"],"answer":0},
        {"q":"What is a crime?","options":["Legal act","Act violating law","Mistake"],"answer":1},
        {"q":"Role of a Jury?","options":["Determine guilt/innocence","Write laws","Enforce parking"],"answer":0},
        {"q":"What is bail?","options":["Temporary release money","Sentence","Evidence"],"answer":0}
    ],
    "medium": [
        {"q":"Difference between felony and misdemeanor?","options":["Felony is more serious","Misdemeanor is federal","No difference"],"answer":0},
        {"q":"What is Homicide?","options":["Killing another person","Stealing","Arson"],"answer":0},
        {"q":"Self-defense is?","options":["Aggression","Justification for force","Illegal"],"answer":1},
        {"q":"What is Parole?","options":["Early release with conditions","Death penalty","Acquittal"],"answer":0}
    ],
    "hard": [
        {"q":"What is Mens Rea?","options":["Guilty mind / Intent","Physical act","Alibi"],"answer":0},
        {"q":"Actus Reus refers to?","options":["Criminal act","Intent","Locally"],"answer":0},
        {"q":"Double Jeopardy means?","options":["Tried twice for same crime","Higher fine","Second chance"],"answer":0},
        {"q":"What is Habeas Corpus?","options":["Protection against unlawful detention","Theft law","Contract"],"answer":0}
    ]
}'),
('International Law', 'LAW', 'Global Law', '{
    "easy": [
        {"q":"Where is the UN headquarters?","options":["New York","Geneva","London"],"answer":0},
        {"q":"What is a Treaty?","options":["Agreement between nations","Internal law","Private deal"],"answer":0},
        {"q":"Who is in the Security Council?","options":["P5 members + 10 non-permanent","All nations","USA only"],"answer":0},
        {"q":"Goal of International Law?","options":["Peace/Cooperation","Global war","Trade only"],"answer":0}
    ],
    "medium": [
        {"q":"What does Geneva Convention cover?","options":["Trade deals","Warfare and humanitarian","Climate change"],"answer":1},
        {"q":"Sovereignty means?","options":["Independence/Self-rule","Global rule","No borders"],"answer":0},
        {"q":"What is Diplomacy?","options":["Negotiation between nations","War","Sanctions"],"answer":0},
        {"q":"International Court of Justice location?","options":["The Hague","Paris","New York"],"answer":0}
    ],
    "hard": [
        {"q":"What establishes jurisdiction of the ICC?","options":["Rome Statute","Paris Agreement","UN Charter"],"answer":0},
        {"q":"Non-refoulement is related to?","options":["Refugees","Trade","Space"],"answer":0},
        {"q":"What is Jus Cogens?","options":["Fundalmental preemptory norms","Local laws","Optional treaties"],"answer":0},
        {"q":"United Nations Charter is?","options":["Foundational treaty","News report","Lawsuit"],"answer":0}
    ]
}'),
('Marketing MBA', 'BUSINESS', 'Marketing', '{
    "easy": [
        {"q":"What does B2B mean?","options":["Business to Business","Buy to Build","Brand to Brand"],"answer":0},
        {"q":"What are the 4Ps of marketing?","options":["Product, Price, Place, Promotion","Plan, Power, People, Post","Price, Profit, Path, Post"],"answer":0},
        {"q":"What is a target audience?","options":["Group likely to buy","Everyone","Competitors"],"answer":0},
        {"q":"Goal of branding?","options":["Sales","Identity/Recognition","Lower price"],"answer":1}
    ],
    "medium": [
        {"q":"What is SEO strategy?","options":["Search Engine Optimization","Sales Outsourcing","Stock Exchange"],"answer":0},
        {"q":"What is a Market Segment?","options":["Dividing market into groups","Total market","One customer"],"answer":0},
        {"q":"Value Proposition means?","options":["Reason to buy from you","Price tag","Logo"],"answer":0},
        {"q":"Social Media Marketing goal?","options":["Engagement/Traffic","Printing flyers","Radio ads"],"answer":0}
    ],
    "hard": [
        {"q":"Customer Acquisition Cost formula?","options":["Total Sales / Customers","Sales Marketing Cost / New Customers","Revenue - Cost"],"answer":1},
        {"q":"What is SWOT analysis?","options":["Strengths, Weaknesses, Opportunities, Threats","System Way of Trading","Sales Work Over Time"],"answer":0},
        {"q":"Blue Ocean Strategy refers to?","options":["Uncontested market space","Fierce competition","Oceanography"],"answer":0},
        {"q":"Lifetime Value (LTV) of a customer?","options":["Predicted net profit from entire relationship","First sale value","Age of customer"],"answer":0}
    ]
}'),
('Finance MBA', 'BUSINESS', 'Finance', '{
    "easy": [
        {"q":"What is ROI?","options":["Return on Investment","Rate of Interest","Risk of Inflation"],"answer":0},
        {"q":"What is a Budget?","options":["Financial plan","Bank account","Credit card"],"answer":0},
        {"q":"Main source of company profit?","options":["Revenue minus Expenses","Loans","Investments"],"answer":0},
        {"q":"What is Inflation?","options":["Rise in prices","Drop in prices","No change"],"answer":0}
    ],
    "medium": [
        {"q":"What represents corporate ownership?","options":["Bonds","Stocks","Loans"],"answer":1},
        {"q":"What is Liquidity?","options":["Ease of converting to cash","Company size","Water cooling"],"answer":0},
        {"q":"A Surplus happens when?","options":["Income > Expenses","Expenses > Income","Both equal"],"answer":0},
        {"q":"What is Diversification?","options":["Spreading investments","Putting all in one","Savings only"],"answer":0}
    ],
    "hard": [
        {"q":"What does EBITDA stand for?","options":["Earnings Before Interest, Taxes, Depreciation, Amortization","External Business Income Tax","Equity Bond Interest"],"answer":0},
        {"q":"Capital Structure refers to?","options":["Mix of debt and equity","Building design","Number of employees"],"answer":0},
        {"q":"Net Present Value (NPV) helps?","options":["Project profitability","Past sales","Employee count"],"answer":0},
        {"q":"Derivatives are?","options":["Financial contracts derived from assets","Math units","Tax codes"],"answer":0}
    ]
}'),
('HR Management', 'BUSINESS', 'Human Resources', '{
    "easy": [
        {"q":"What is HR responsible for?","options":["Sales","Employee relations","Manufacturing"],"answer":1},
        {"q":"What is Recruitment?","options":["Finding/Hiring talent","Firing people","Selling products"],"answer":0},
        {"q":"What is a Job Description?","options":["List of tasks/duties","Salary only","Employee name"],"answer":0},
        {"q":"Goal of Orientation?","options":["Introducing new hires","Cleaning office","Testing"],"answer":0}
    ],
    "medium": [
        {"q":"What does KPI stand for?","options":["Key Performance Indicator","Known Public Interest","Key Identity"],"answer":0},
        {"q":"Talent Management involves?","options":["Developing/Retaining staff","Actor hiring","Buying robots"],"answer":0},
        {"q":"Performance Review goal?","options":["Feedback and growth","Lowering pay","Socializing"],"answer":0},
        {"q":"Workplace Culture is?","options":["Values/Behaviors of org","Office location","Dress code only"],"answer":0}
    ],
    "hard": [
        {"q":"360-degree feedback method?","options":["Manager only","Peer, manager, and subordinate review","Self review"],"answer":1},
        {"q":"Succession Planning means?","options":["Preparing future leaders","Filing taxes","Organizing parties"],"answer":0},
        {"q":"Employee Engagement refers to?","options":["Emotional commitment to org","Marriage","Typing speed"],"answer":0},
        {"q":"Soft Skills are?","options":["People/Interpersonal skills","Software skills","Hard skills"],"answer":0}
    ]
}'),
('CA (Accountant)', 'CHARTERED', 'Accounting', '{
    "easy": [
        {"q":"What is a balance sheet?","options":["Assets & Liabilities","Sales list","Attendance"],"answer":0},
        {"q":"What is a Ledger?","options":["Record of accounts","Phone book","Diary"],"answer":0},
        {"q":"Debit vs Credit?","options":["Left vs Right in accounts","Plus vs Minus","Buy vs Sell"],"answer":0},
        {"q":"Goal of Auditing?","options":["Verification of records","Selling stocks","Managing staff"],"answer":0}
    ],
    "medium": [
        {"q":"What is double-entry bookkeeping?","options":["Entering twice","Every transaction has debit and credit","Two checkers"],"answer":1},
        {"q":"GAAP stands for?","options":["Generally Accepted Accounting Principles","Global Account Policy","Account Plan"],"answer":0},
        {"q":"Depreciation means?","options":["Reduction in asset value","Increase in value","Taxes"],"answer":0},
        {"q":"Financial Statements show?","options":["Performance/Position","Employee list","Marketing plan"],"answer":0}
    ],
    "hard": [
        {"q":"What is IFRS?","options":["Intl Financial Reporting Standards","Internal Fraud System","Independent Reserve"],"answer":0},
        {"q":"Accrual Accounting is?","options":["Recording when earned/incurred","Cash only","Post-dated"],"answer":0},
        {"q":"Equity refers to?","options":["Owner interest in assets","Loans","Cash"],"answer":0},
        {"q":"Tax Liability is?","options":["Amount owed to gov","Refund","Deduction"],"answer":0}
    ]
}'),
('CMA', 'CHARTERED', 'Cost Management', '{
    "easy": [
        {"q":"What does CMA stand for?","options":["Certified Management Accountant","Cost Marketing Agent","Corporate Audit"],"answer":0},
        {"q":"What is a Cost?","options":["Amount spent","Price sold","Profit"],"answer":0},
        {"q":"Variable Cost depends on?","options":["Production volume","Time","Location"],"answer":0},
        {"q":"Goal of Cost Control?","options":["Efficiency/Savings","Spending more","Hiring"],"answer":0}
    ],
    "medium": [
        {"q":"What is a fixed cost?","options":["Rent","Raw materials","Sales commission"],"answer":0},
        {"q":"Break-even point is?","options":["Revenue = Total Cost","Loss","Huge profit"],"answer":0},
        {"q":"Cost of Goods Sold (COGS)?","options":["Direct costs of production","Marketing","Admin"],"answer":0},
        {"q":"Inventory Management goal?","options":["Balance supply/demand","Buying infinite","Zero stock"],"answer":0}
    ],
    "hard": [
        {"q":"What is variance analysis used for?","options":["Diff between actual and planned","Tax evasion","Employee turnover"],"answer":0},
        {"q":"Activity Based Costing (ABC) focuses on?","options":["Indirect cost allocation","Sales","Publicity"],"answer":0},
        {"q":"Contribution Margin is?","options":["Sales - Variable Cost","Revenue","Fixed cost"],"answer":0},
        {"q":"Overhead costs are?","options":["Indirect operational costs","Salary","Raw materials"],"answer":0}
    ]
}'),
('UI/UX Design', 'CREATIVE', 'UX Design', '{
    "easy": [
        {"q":"What does UX stand for?","options":["User Experience","Unified X-Ray","User Exam"],"answer":0},
        {"q":"What is a Persona?","options":["Hypothetical user profile","Actor","Real user"],"answer":0},
        {"q":"Goal of usability?","options":["Ease of use","Pretty colors","Fast speed"],"answer":0},
        {"q":"What is a Wireframe?","options":["Blueprint/Layout","Final code","Logo"],"answer":0}
    ],
    "medium": [
        {"q":"What is a wireframe?","options":["Low-fidelity layout","Final code","Color palette"],"answer":0},
        {"q":"Information Architecture refers to?","options":["Organizing content","Building PC","Drawing"],"answer":0},
        {"q":"User Flow is?","options":["Path user takes","Water flow","Coding logic"],"answer":0},
        {"q":"What is Prototyping?","options":["Interactive model","Static image","Final app"],"answer":0}
    ],
    "hard": [
        {"q":"Which heuristic focuses on preventing user errors?","options":["Aesthetic design","Error Prevention","Consistency"],"answer":1},
        {"q":"Accessibility (a11y) design means?","options":["Design for all abilities","Fast loading","Free to use"],"answer":0},
        {"q":"Affordance refers to?","options":["Visual cues for action","Price","Size"],"answer":0},
        {"q":"Responsive Design means?","options":["Layout adapts to screens","Fast reply","AI chat"],"answer":0}
    ]
}'),
('Graphic Design', 'CREATIVE', 'Visual Design', '{
    "easy": [
        {"q":"Primary color model for digital screens?","options":["CMYK","RGB","Grayscale"],"answer":1},
        {"q":"What is a Vector graphic?","options":["Scaleable math based","Pixel based","Scan"],"answer":0},
        {"q":"What is Negative Space?","options":["Area around subject","Black color","Bad design"],"answer":0},
        {"q":"Adobe Photoshop is used for?","options":["Photo editing","Vector logos","Typing"],"answer":0}
    ],
    "medium": [
        {"q":"What is typography?","options":["Art of arranging type","Color mixing","Drawing curves"],"answer":0},
        {"q":"What is CMYK used for?","options":["Printing","Web","Video"],"answer":0},
        {"q":"Kerning refers to?","options":["Space between letters","Font size","Line height"],"answer":0},
        {"q":"What is a Brand Identity?","options":["Visual representation of brand","Company name","Product price"],"answer":0}
    ],
    "hard": [
        {"q":"What does EPS stand for in file formats?","options":["Encapsulated PostScript","Extra Pixel Styling","Picture Source"],"answer":0},
        {"q":"Rule of Thirds helps?","options":["Composition/Balance","Color","Scaling"],"answer":0},
        {"q":"What is Raster vs Vector?","options":["Pixels vs Math","Big vs Small","Real vs Fake"],"answer":0},
        {"q":"Purpose of Grids?","options":["Structure/Alignment","Decoration","Drawing"],"answer":0}
    ]
}'),
('Animation', 'CREATIVE', '3D Animation', '{
    "easy": [
        {"q":"What is a keyframe?","options":["A frame with a key","A drawing that defines start/end","Hardware part"],"answer":1},
        {"q":"Standard FPS for movies?","options":["24","60","12"],"answer":0},
        {"q":"What is Squash and Stretch?","options":["Exaggerating motion","Resizing window","Scaling"],"answer":0},
        {"q":"A Flipbook is?","options":["Manual animation","Kindle","Notebook"],"answer":0}
    ],
    "medium": [
        {"q":"What is rigging in 3D?","options":["Applying textures","Adding bones for movement","Rendering"],"answer":1},
        {"q":"What is Rendering?","options":["Generating final image/video","Applying paint","Sketching"],"answer":0},
        {"q":"What are ''The 12 Principles''?","options":["Foundation of animation","Coding rules","Law"],"answer":0},
        {"q":"Motion Blur occurs when?","options":["Fast movement","Low light","Statics"],"answer":0}
    ],
    "hard": [
        {"q":"What does FPS stand for?","options":["First Person","Frames Per Second","Final Pro System"],"answer":1},
        {"q":"Anticipation principle means?","options":["Preparing audience for action","Guessing","Boredom"],"answer":0},
        {"q":"Rotoscoping is?","options":["Tracing over life footage","3D modeling","Sound design"],"answer":0},
        {"q":"Easing in/out relates to?","options":["Acceleration/Deceleration","Color","Lighting"],"answer":0}
    ]
}'),
('App Development', 'IT', 'Software Dev', '{
    "easy": [
        {"q":"What is an API?","options":["Application Programming Interface","Apple Protocol","Automated Ping Index"],"answer":0},
        {"q":"Language for iOS?","options":["Swift","Java","Kotlin"],"answer":0},
        {"q":"Language for Android?","options":["Kotlin/Java","PHP","C#"],"answer":0},
        {"q":"What is a Mobile App Store?","options":["Platform for apps","Hardware shop","Library"],"answer":0}
    ],
    "medium": [
        {"q":"Which framework builds cross-platform apps?","options":["React Native","C# Core","JSP"],"answer":0},
        {"q":"State Management helps?","options":["Managing app data","Screen brightness","Sound"],"answer":0},
        {"q":"What is Firebase?","options":["Backend-as-a-Service","Game console","Editor"],"answer":0},
        {"q":"What is a SDK?","options":["Software Development Kit","System Disk Key","Sound Data Kit"],"answer":0}
    ],
    "hard": [
        {"q":"What is MVC pattern?","options":["Model View Controller","Micro Virtual Component","Multiple Variable Code"],"answer":0},
        {"q":"RESTful services use?","options":["HTTP/JSON","Binary","Paper"],"answer":0},
        {"q":"Continuous Integration (CI)?","options":["Automated code building/testing","Manual check","Sales"],"answer":0},
        {"q":"What is Hot Reloading?","options":["Updating code without restart","Fast CPU","Cooking"],"answer":0}
    ]
}'),
('Digital Marketing', 'IT', 'SEO', '{
    "easy": [
        {"q":"What does PPC stand for?","options":["Pay Per Click","Post Per Channel","Private Proxy Connection"],"answer":0},
        {"q":"What is SEO?","options":["Search Engine Optimization","Social Extra Order","System Entry"],"answer":0},
        {"q":"Facebook Ads is?","options":["Paid social ad","Free post","Internal tool"],"answer":0},
        {"q":"What is a Lead?","options":["Potential customer info","The metal","The boss"],"answer":0}
    ],
    "medium": [
        {"q":"What is a bounce rate?","options":["Users leaving without interaction","Click-through rate","Email open rate"],"answer":0},
        {"q":"CTR abbreviation?","options":["Click-Through Rate","Central Time Reset","Code Test Report"],"answer":0},
        {"q":"Keyword research goal?","options":["Finding what users search for","Buying words","Spelling"],"answer":0},
        {"q":"What is an Email Campaign?","options":["Bulk emails for marketing","Private chat","Spam only"],"answer":0}
    ],
    "hard": [
        {"q":"What is a backlink?","options":["Homepage link","Link from another website to yours","Broken link"],"answer":1},
        {"q":"Google Analytics tracks?","options":["Website traffic/behavior","Computer speed","Weather"],"answer":0},
        {"q":"Sales Funnel stages?","options":["Awareness, Interest, Decision, Action","Stop, Go, Wait","None"],"answer":0},
        {"q":"What is Remarketing?","options":["Targeting previous visitors","Selling again","Discounting"],"answer":0}
    ]
}'),
('Public Speaking', 'SOFT_SKILLS', 'Communication', '{
    "easy": [
        {"q":"Why is eye contact important?","options":["Builds connection","Scare the audience","Avoid forgetting"],"answer":0},
        {"q":"Body language helps?","options":["Convey confidence/meaning","Hiding nervousness","Nothing"],"answer":0},
        {"q":"What is Stage Fright?","options":["Anxiety about performing","Falling off stage","Light blindness"],"answer":0},
        {"q":"How to start a speech?","options":["Strong hook","Apologizing","Silence"],"answer":0}
    ],
    "medium": [
        {"q":"What is an impromptu speech?","options":["Read from script","Given without preparation","Memorized perfectly"],"answer":1},
        {"q":"Persuading involves?","options":["Evidence/Emotion","Shouting","Commands"],"answer":0},
        {"q":"What is Pausing used for?","options":["Emphasis/Breath","Boredom","Forgetfulness"],"answer":0},
        {"q":"Active Listening is?","options":["Paying full attention","Interrupting","Nodding blindly"],"answer":0}
    ],
    "hard": [
        {"q":"What is vocal variety?","options":["Different languages","Changing pitch, tone, and volume","Using a microphone"],"answer":1},
        {"q":"Rhetoric refers to?","options":["Art of persuasion","Grammar","Poetry"],"answer":0},
        {"q":"Ethos, Pathos, Logos?","options":["Credibility, Emotion, Logic","Name of stars","Old gods"],"answer":0},
        {"q":"TED Talk style focuses on?","options":["Idea worth spreading","Complex graphs","Reading"],"answer":0}
    ]
}'),
('Leadership Mastery', 'SOFT_SKILLS', 'Leadership', '{
    "easy": [
        {"q":"What defines a good leader?","options":["Inspires and guides","Micromanages","Takes all credit"],"answer":0},
        {"q":"Leader vs Manager?","options":["Vision vs Execution","Power vs Control","No diff"],"answer":0},
        {"q":"Empathy helps a leader?","options":["Understand team needs","Manipulation","Weakness"],"answer":0},
        {"q":"What is delegation?","options":["Assigning tasks","Doing all yourself","Firing"],"answer":0}
    ],
    "medium": [
        {"q":"What is transformational leadership?","options":["Strict rules","Motivating followers to exceed expectations","Delegating"],"answer":1},
        {"q":"Conflict Resolution?","options":["Finding win-win solutions","Ignoring","Fighting"],"answer":0},
        {"q":"Decision Making skills?","options":["Choosing best path","Flipping coin","Delaying"],"answer":0},
        {"q":"What is Empowerment?","options":["Giving autonomy/confidence","Micromanagement","Salary"],"answer":0}
    ],
    "hard": [
        {"q":"Emotional intelligence (EI) involve?","options":["High IQ","Managing own and others emotions","Hiding feelings"],"answer":1},
        {"q":"Strategic Thinking refers to?","options":["Long-term planning/Vision","Day-to-day work","Typing"],"answer":0},
        {"q":"Accountability means?","options":["Taking responsibility","Blaming","Hiding errors"],"answer":0},
        {"q":"Diversity/Inclusion benefits?","options":["Better ideas/Reach","Higher cost","More rules"],"answer":0}
    ]
}'),
('Psychology', 'ARTS', 'Psychology', '{
    "easy": [
        {"q":"Study of the mind?","options":["Biology","Psychology","Sociology"],"answer":1},
        {"q":"What is Behavior?","options":["Observable actions","Thoughts","Dreams"],"answer":0},
        {"q":"Core of Humanism?","options":["Self-actualization","Animal study","Brain chemistry"],"answer":0},
        {"q":"What is Memory?","options":["Storing/Retrieving info","Drawing","Hearing"],"answer":0}
    ],
    "medium": [
        {"q":"Who founded psychoanalysis?","options":["Carl Jung","B.F. Skinner","Sigmund Freud"],"answer":2},
        {"q":"Nature vs Nurture?","options":["Genetics vs Environment","Trees vs Buildings","Real vs Fake"],"answer":0},
        {"q":"Classical Conditioning experiment?","options":["Pavlov''s Dog","Schrodinger''s Cat","Rat maze"],"answer":0},
        {"q":"What is EQ?","options":["Emotional Quotient","Expert Quality","Extra Question"],"answer":0}
    ],
    "hard": [
        {"q":"Cognitive behavioral therapy is based on?","options":["Changing thought patterns","Dream analysis","Medication only"],"answer":0},
        {"q":"Maslow''s Hierarchy?","options":["Psychological needs to self-actualization","Food chain","Job levels"],"answer":0},
        {"q":"Neurotransmitters are?","options":["Chemical messengers","Brain parts","Electric wires"],"answer":0},
        {"q":"Placebo Effect?","options":["Improvement due to belief","Drug reaction","Fake data"],"answer":0}
    ]
}'),
('Journalism', 'ARTS', 'Writing', '{
    "easy": [
        {"q":"Main goal of journalism?","options":["Entertainment","Inform truthfully","Sell products"],"answer":1},
        {"q":"What is a Headline?","options":["Main title","Page number","Advertisement"],"answer":0},
        {"q":"Objective reporting means?","options":["Fair/Unbiased","Personal opinion","Lying"],"answer":0},
        {"q":"Who is a Source?","options":["Person providing info","Paper","Printer"],"answer":0}
    ],
    "medium": [
        {"q":"What is an editorial?","options":["Opinion piece","Breaking news","Weather report"],"answer":0},
        {"q":"Inverted Pyramid style?","options":["Most important info first","Ending first","Random"],"answer":0},
        {"q":"What is Plagiarism?","options":["Stealing work/ideas","Fair use","Quoting"],"answer":0},
        {"q":"Press release goal?","options":["Official statement for media","Internal chat","Diary"],"answer":0}
    ],
    "hard": [
        {"q":"What does off the record mean?","options":["Information cannot be published","Recorded secretly","Public domain"],"answer":0},
        {"q":"Investigative Journalism focuses on?","options":["Uncovering secrets/Wrongdoing","Sports","Celebrities"],"answer":0},
        {"q":"Ethics in journalism?","options":["Truth/Accuracy/Independence","Selling ads","Famous"],"answer":0},
        {"q":"Public Interest refers to?","options":["Benefit to society","Popularity count","Movie rating"],"answer":0}
    ]
}'),
('Sociology', 'ARTS', 'Societal Analysis', '{
    "easy": [
        {"q":"What does sociology study?","options":["Human societies","Inner brain workings","Ancient bones"],"answer":0},
        {"q":"What is Culture?","options":["Shared beliefs/Values","Art only","History"],"answer":0},
        {"q":"Basic unit of society?","options":["Family","Individual","Company"],"answer":0},
        {"q":"What is a Social Role?","options":["Expected behavior in position","Actor","Game part"],"answer":0}
    ],
    "medium": [
        {"q":"What is a social norm?","options":["A legal law","Expected behavior in a society","A government policy"],"answer":1},
        {"q":"Socialization means?","options":["Learning culture/norms","Going to parties","Talking"],"answer":0},
        {"q":"Urbanization refers to?","options":["Growth of cities","Farming","Mining"],"answer":0},
        {"q":"Social Inequality is?","options":["Unequal distribution of resources","Same pay for all","No rules"],"answer":0}
    ],
    "hard": [
        {"q":"Which theorist is associated with class struggle?","options":["Emile Durkheim","Max Weber","Karl Marx"],"answer":2},
        {"q":"Social Stratification means?","options":["Ranking of people in hierarchy","Soil layers","Mixing"],"answer":0},
        {"q":"Collective Consciousness?","options":["Shared beliefs/morals","Group chat","Brain wash"],"answer":0},
        {"q":"Sociological Perspective means?","options":["Analyzing social context","Private view","Nothing"],"answer":0}
    ]
}');

SET FOREIGN_KEY_CHECKS = 1; -- Restore integrity checks
