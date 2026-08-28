package com.smartskillmap.repository;

import com.smartskillmap.model.Assessment;
import com.smartskillmap.model.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AssessmentRepository extends JpaRepository<Assessment, Long> {
    List<Assessment> findByCategory(Skill.Category category);
}
