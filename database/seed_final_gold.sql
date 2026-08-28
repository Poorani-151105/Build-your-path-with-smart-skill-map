USE smart_skill_map;

-- Wipe previous questions for clean Gold release
DELETE FROM assessments;

-- 🔷 1. ENGINEERING / TECH
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Engineering Entry Exam', 'ENGINEERING', 'Java Programming', '{
    "easy": [
        {"q":"Which keyword is used to inherit a class in Java?","options":["implements","extends","inherits"],"answer":1},
        {"q":"Default value of a boolean in Java?","options":["true","false","null"],"answer":1},
        {"q":"Which of these is NOT a primitive type?","options":["int","float","String"],"answer":2},
        {"q":"How many bytes is an int?","options":["2","4","8"],"answer":1},
        {"q":"Symbol for single line comment?","options":["//","/*","--"],"answer":0}
    ],
    "medium": [
        {"q":"What is the purpose of the ''volatile'' keyword?","options":["Thread safety","Fast access","Memory visibility"],"answer":2},
        {"q":"Which collection doesn''t allow duplicates?","options":["List","Set","Map"],"answer":1},
        {"q":"What is the time complexity of searching in a HashMap (average)?","options":["O(n)","O(log n)","O(1)"],"answer":2},
        {"q":"Which method is called before garbage collection?","options":["finalize()","exit()","clear()"],"answer":0},
        {"q":"Is Java pass-by-value or pass-by-reference?","options":["Pass-by-value","Pass-by-reference","Both"],"answer":0}
    ],
    "hard": [
        {"q":"What is the ''Happens-Before'' relationship in Java Memory Model?","options":["Order of code","Visibility of writes","Stack allocation"],"answer":1},
        {"q":"Difference between CyclicBarrier and CountDownLatch?","options":["C is reusable","D is reusable","No difference"],"answer":0},
        {"q":"How does a B-Tree differ from a Binary Search Tree?","options":["Multi-level","Multi-child nodes","Ordered"],"answer":1},
        {"q":"Which GC algorithm is most efficient for large heaps?","options":["Serial","G1","Parallel"],"answer":1},
        {"q":"Can you override a static method?","options":["Yes","No","Only if public"],"answer":1}
    ]
}');

-- 🏥 MEDICAL & HEALTHCARE
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Medical Aptitude', 'MEDICAL', 'Medical Science', '{
    "easy": [
        {"q":"How many bones are in the adult human body?","options":["200","206","210"],"answer":1},
        {"q":"Largest organ of the human body?","options":["Liver","Brain","Skin"],"answer":2},
        {"q":"Which blood type is the universal donor?","options":["A+","O-","AB-"],"answer":1},
        {"q":"Primary gas exchanged in lungs?","options":["Nitrogen","Oxygen","Argon"],"answer":1},
        {"q":"Normal human body temperature in Celsius?","options":["35","37","39"],"answer":1}
    ],
    "medium": [
        {"q":"What is the medical term for high blood pressure?","options":["Hypotension","Hypertension","Hyperglycemia"],"answer":1},
        {"q":"Which part of the brain controls balance?","options":["Cerebrum","Cerebellum","Thalamus"],"answer":1},
        {"q":"Inflammation of the liver is called?","options":["Hepatitis","Gastritis","Nephritis"],"answer":0},
        {"q":"Function of hemoglobin?","options":["Clotting","Oxygen transport","Immunity"],"answer":1},
        {"q":"Smallest bone in the body?","options":["Femur","Stapes","Radius"],"answer":1}
    ],
    "hard": [
        {"q":"First-line treatment for anaphylactic shock?","options":["Aspirin","Epinephrine","Insulin"],"answer":1},
        {"q":"Normal range for adult heart rate?","options":["40-60","60-100","100-120"],"answer":1},
        {"q":"Which vitamin is essential for blood clotting?","options":["Vitamin C","Vitamin K","Vitamin D"],"answer":1},
        {"q":"Primary hormone for blood sugar regulation?","options":["Glucagon","Insulin","Thyroxine"],"answer":1},
        {"q":"Percentage of water in the average adult body?","options":["50%","60%","70%"],"answer":1}
    ]
}');

-- ⚖️ LAW & LEGAL
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Legal Reasoning Test', 'LAW', 'Legal Reasoning', '{
    "easy": [
        {"q":"Who is the highest judicial officer in a state?","options":["Gov","Chief Justice","CM"],"answer":1},
        {"q":"Right to Privacy is a?","options":["Legal Right","Fundamental Right","Statutory Right"],"answer":1},
        {"q":"Minimum age for voting in India?","options":["16","18","21"],"answer":1}
    ],
    "medium": [
        {"q":"Writ for unlawful detention?","options":["Mandamus","Habeas Corpus","Prohibition"],"answer":1},
        {"q":"Contract with a minor is?","options":["Voidable","Void ab initio","Valid"],"answer":1},
        {"q":"Article for Fundamental Duties?","options":["50","51A","52"],"answer":1}
    ],
    "hard": [
        {"q":"Doctrine of ''Pith and Substance'' relates to?","options":["Contracts","Legislative Powers","Criminal Law"],"answer":1},
        {"q":"First CJI of India?","options":["H.J. Kania","P.N. Bhagwati","R.S. Pathak"],"answer":0},
        {"q":"Parliamentary form of government is borrowed from?","options":["USA","UK","Canada"],"answer":1}
    ]
}');

-- 📊 BUSINESS & MANAGEMENT
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Strategic Thinking', 'BUSINESS', 'Business Strategy', '{
    "easy": [
        {"q":"What does SWOT stand for?","options":["Strength, Weak, Opp, Treat","Success, Win, Out, Time"],"answer":0},
        {"q":"Primary goal of a business?","options":["Charity","Profit","Social Media"],"answer":1}
    ],
    "medium": [
        {"q":"Porter''s 5 Forces measures?","options":["Marketing","Competitive Rivalry","HR"],"answer":1},
        {"q":"Break-even point is?","options":["Loss","No profit no loss","Max profit"],"answer":1}
    ],
    "hard": [
        {"q":"Ansoff Matrix is used for?","options":["Hiring","Growth Strategies","Tax"],"answer":1},
        {"q":"Just-in-Time (JIT) originated in?","options":["USA","Japan","Germany"],"answer":1}
    ]
}');

-- 🎨 CREATIVE / DESIGN
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Visual Aptitude', 'CREATIVE', 'Problem Solving', '{
    "easy": [
        {"q":"Which color is often associated with calm?","options":["Red","Blue","Orange"],"answer":1},
        {"q":"Primary colors?","options":["Red, Yellow, Blue","Purple, Green, Pink"],"answer":0}
    ],
    "medium": [
        {"q":"CMYK is used for?","options":["Screen","Print","Photography"],"answer":1},
        {"q":"Heuristic Evaluation relates to?","options":["Coding","UX Testing","Color Theory"],"answer":1}
    ],
    "hard": [
        {"q":"Golden Ratio in design is approx?","options":["1.5","1.618","2.0"],"answer":1},
        {"q":"Fitts'' Law relates to?","options":["Colors","Target size & Distance","Contrast"],"answer":1}
    ]
}');

-- 🗣️ SOFT SKILLS
INSERT INTO assessments (title, category, target_skill_name, questions_json) VALUES 
('Communication Benchmark', 'SOFT_SKILLS', 'Communication', '{
    "easy": [
        {"q":"Most important part of communication?","options":["Speaking","Listening","Emailing"],"answer":1},
        {"q":"What is non-verbal communication?","options":["Body language","Vocabulary","Grammar"],"answer":0}
    ],
    "medium": [
        {"q":"Emotional Intelligence (EQ) is?","options":["Logic","Managing emotions","Reading speed"],"answer":1},
        {"q":"Active listening involves?","options":["Nodding","Asking questions","Both"],"answer":2}
    ],
    "hard": [
        {"q":"Transactional Analysis (Parent-Adult-Child) was developed by?","options":["Freud","Eric Berne","Jung"],"answer":1},
        {"q":"Paradox of choice in communication?","options":["More options is better","Too many options causes stress","Less is more"],"answer":1}
    ]
}');
