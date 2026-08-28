package com.smartskillmap.repository;

import com.smartskillmap.model.UserAssessment;
import com.smartskillmap.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserAssessmentRepository extends JpaRepository<UserAssessment, Long> {
    List<UserAssessment> findByUser(User user);
    List<UserAssessment> findByUserOrderByCompletedAtAsc(User user);
}
