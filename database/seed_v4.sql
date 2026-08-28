-- Phase 4: Premium Domain Data & Adaptive Structure
USE smart_skill_map;

-- 1. Domain: Computer Science (Adaptive)
INSERT INTO assessments (title, category, questions_json) VALUES 
('Computer Science Core', 'TECHNICAL', '{
    "easy": [
        {"q": "Which of these is a front-end framework?", "options": ["Django", "React", "Express", "Flask"], "answer": 1},
        {"q": "What does CSS stand for?", "options": ["Cascading Style Sheets", "Classic Style Sheets", "Common Style Sheets", "None"], "answer": 0}
    ],
    "medium": [
        {"q": "What is the complexity of searching in a sorted array?", "options": ["O(n)", "O(log n)", "O(n^2)", "O(1)"], "answer": 1},
        {"q": "Which protocol is used for secure transmission?", "options": ["HTTP", "HTTPS", "FTP", "SNMP"], "answer": 1}
    ],
    "hard": [
        {"q": "In a distributed system, what does the CAP theorem stand for?", "options": ["Consistency, Availability, Partition", "Capacity, Availability, Performance", "Critical, Active, Passive"], "answer": 0},
        {"q": "Which of these is NOT an ACID property in DB?", "options": ["Atomicity", "Consistency", "Isolation", "Durability", "Performance"], "answer": 4}
    ]
}');

-- 2. Domain: Medical Science (Aptitude)
INSERT INTO assessments (title, category, questions_json) VALUES 
('Medical Aptitude', 'TECHNICAL', '{
    "easy": [
        {"q": "How many bones in a human adult?", "options": ["200", "206", "210", "300"], "answer": 1},
        {"q": "Which vitamin is essential for blood clotting?", "options": ["Vit A", "Vit C", "Vit K", "Vit D"], "answer": 2}
    ],
    "medium": [
        {"q": "Functional unit of the kidney?", "options": ["Neuron", "Nephron", "Alveoli", "Glomerulus"], "answer": 1},
        {"q": "Universal blood donor group?", "options": ["AB+", "O-", "O+", "A-"], "answer": 1}
    ],
    "hard": [
        {"q": "Which hormone regulates the metabolic rate?", "options": ["Insulin", "Thyroxine", "Adrenaline", "Estrogen"], "answer": 1},
        {"q": "The pacemaker of the heart is located in?", "options": ["Left Atrium", "Right Atrium", "Ventricular Septum"], "answer": 1}
    ]
}');

-- 3. Domain: Business Management
INSERT INTO assessments (title, category, questions_json) VALUES 
('Business & Strategy', 'TECHNICAL', '{
    "easy": [
        {"q": "What does ROI stand for?", "options": ["Return on Investment", "Rate of Interest", "Risk of Inflation"], "answer": 0},
        {"q": "Who is known as the father of Management?", "options": ["Peter Drucker", "Henry Ford", "Steve Jobs"], "answer": 0}
    ],
    "medium": [
        {"q": "SWOT analysis stands for Strengths, Weaknesses, Opportunities, and:", "options": ["Trends", "Threats", "Teams", "Targets"], "answer": 1},
        {"q": "What is a Unicorn in startup terms?", "options": ["Valuation > $1B", "Profit > $100M", "Employee count > 10k"], "answer": 0}
    ],
    "hard": [
        {"q": "What is the P/E ratio in stocks?", "options": ["Price to Equity", "Price to Earnings", "Performance to Energy"], "answer": 1},
        {"q": "Which marketing P refers to the distribution channel?", "options": ["Price", "Place", "Product", "Promotion"], "answer": 1}
    ]
}');
