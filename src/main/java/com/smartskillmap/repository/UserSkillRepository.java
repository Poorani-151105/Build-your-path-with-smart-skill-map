package com.smartskillmap.repository;

import com.smartskillmap.model.UserSkill;
import com.smartskillmap.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserSkillRepository extends JpaRepository<UserSkill, Long> {
    List<UserSkill> findByUser(User user);
}
