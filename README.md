# Smart Skill Map System

A comprehensive, AI-driven career pathing and assessment platform.

## Prerequisites
Before running the application, make sure you have the following installed on your machine:
1. **Java** (JDK 17 or higher)
2. **Maven** (Apache Maven)
3. **MySQL Server** & **MySQL Workbench**

## Database Setup

1. Open **MySQL Workbench** and connect to your local database using:
   - Username: `root`
   - Password: `root25`
   *(If your password is different, update the `application.properties` file in `src/main/resources/` accordingly).*

2. Create the initial database:
   ```sql
   CREATE DATABASE IF NOT EXISTS smartskillmap;
   ```

3. Open the file `database/reset_and_seed_final.sql` in MySQL Workbench.
4. Execute the entire script (click the Lightning Bolt icon). This will create all necessary tables and seed the system with 29 career paths and assessments.

## Running the Application

1. Open your terminal (PowerShell or Command Prompt) and navigate to the root directory of the project (`SmartSkillMap_Master`).
2. Run the following Maven command to start the Spring Boot server:

   ```bash
   mvn spring-boot:run
   ```

3. Wait until you see a message similar to: `Tomcat started on port 8081`. 

## Accessing the Application

Once the server is running, open your web browser and go to:
[http://localhost:8081/](http://localhost:8081/)

## Features

- 🔐 **Secure Login & Signup** — user authentication with a demo account shortcut for quick testing
- 🧭 **Career Path Hub** — choose between **Professional Degrees** (Engineering, Medical, Law, Management, Finance) and **Skill-Based Paths** (Creative, IT & Digital, Soft Skills, Arts & Humanities)
- 📝 **29 Career Assessments** — domain-specific quizzes covering Computer Science, Data Science, AI, Cyber Security, Mechanical, Civil Engineering, and more
- 📊 **Interactive Dashboard** — Skill Radar (holistic view), Growth Timeline, and active specialization progress tracking
- 🎯 **Career Goal Recommendations** — AI-driven match percentage suggesting the best specialization based on assessment performance
- 📁 **Profile & Result History** — view past assessment scores, active learning tracks, and resume progress anytime
- 🎨 **Modern Glassmorphism UI** — dark theme with gradient accents, built with a clean, responsive design system

## Screenshots

> Screenshot images are stored inside the `screenshots/` folder at the project root.

### 🔐 Login Page
![Login Page](screenshots/login.png)

### ✍️ Sign Up Page
![Sign Up Page](screenshots/register.png)

### 🏠 Home Page
![Home Page](screenshots/home.png)

### 📊 Dashboard
![Dashboard](screenshots/dashboard.png)

### 📝 Assessment Hub — Professional Degrees
![Assessment - Professional Degrees](screenshots/assessment-professional.png)

### 🛠️ Assessment Hub — Skill-Based Paths
![Assessment - Skill Based Paths](screenshots/assessment-skillbased.png)

### 💻 Engineering Category
![Engineering Category](screenshots/assessment-engineering.png)

### 👤 Profile Page
![Profile Page](screenshots/profile.png)

### Common Issues

**Port Already in Use Error?**
If you try to run the server and it immediately crashes stating `Port 8081 is already in use`, you must kill the old hidden process:
- **In PowerShell (Recommended):**
  ```powershell
  Stop-Process -Id (Get-NetTCPConnection -LocalPort 8081).OwningProcess -Force
  ```
- **In Command Prompt (CMD):**
  ```cmd
  for /f "tokens=5" %a in ('netstat -aon ^| findstr :8081') do taskkill /f /pid %a
  ```
Then try running `mvn spring-boot:run` again.