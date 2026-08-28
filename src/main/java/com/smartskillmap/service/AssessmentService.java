package com.smartskillmap.service;

import com.smartskillmap.model.Assessment;
import com.smartskillmap.model.Skill;
import com.smartskillmap.repository.AssessmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AssessmentService {

    @Autowired
    private AssessmentRepository assessmentRepository;

    @Autowired
    private com.smartskillmap.repository.UserAssessmentRepository userAssessmentRepository;

    @Autowired
    private UserService userService;

    public List<Assessment> getAllAssessments() {
        return assessmentRepository.findAll();
    }

    public List<Assessment> getAssessmentsByCategory(Skill.Category category) {
        return assessmentRepository.findByCategory(category);
    }

    public Assessment getAssessment(Long id) {
        return assessmentRepository.findById(id).orElse(null);
    }

    public void saveResult(com.smartskillmap.model.User user, Long assessmentId, int score) {
        Assessment assessment = getAssessment(assessmentId);
        if (assessment != null) {
            // 1. Save historical record
            com.smartskillmap.model.UserAssessment history = new com.smartskillmap.model.UserAssessment();
            history.setUser(user);
            history.setAssessment(assessment);
            history.setScore(score);
            userAssessmentRepository.save(history);

            // 2. Update current skill scores (Dynamic Mapping)
            String skillName = assessment.getTargetSkillName();
            if (skillName == null || skillName.isEmpty()) {
                skillName = "Java Programming"; // Default fallback
            }
            
            userService.updateSkillScore(user, skillName, score);
        }
    }
}
