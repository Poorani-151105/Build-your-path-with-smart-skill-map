package com.smartskillmap.service;

import com.smartskillmap.model.User;
import com.smartskillmap.model.UserSkill;
import com.smartskillmap.model.Skill;
import com.smartskillmap.repository.UserRepository;
import com.smartskillmap.repository.UserSkillRepository;
import com.smartskillmap.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserSkillRepository userSkillRepository;

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User register(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public boolean login(String username, String password) {
        Optional<User> user = userRepository.findByUsername(username);
        return user.isPresent() && passwordEncoder.matches(password, user.get().getPassword());
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public List<UserSkill> getUserSkills(User user) {
        return userSkillRepository.findByUser(user);
    }

    public void updateSkillScore(User user, String skillName, int newScore) {
        // Find skill by name (assuming unique for simplicity)
        Skill skill = skillRepository.findAll().stream()
                .filter(s -> s.getName().equalsIgnoreCase(skillName))
                .findFirst()
                .orElse(null);
        
        if (skill == null) {
            skill = new Skill();
            skill.setName(skillName);
            skill.setCategory(Skill.Category.TECHNICAL);
            skill.setDescription("Auto-tracked via Assessment");
            skill = skillRepository.save(skill);
        }
        
        final Skill finalSkill = skill;
        
        UserSkill userSkill = userSkillRepository.findByUser(user).stream()
                .filter(us -> us.getSkill().getId().equals(finalSkill.getId()))
                .findFirst()
                .orElse(new UserSkill());
        
        userSkill.setUser(user);
        userSkill.setSkill(finalSkill);
        userSkill.setScore((userSkill.getScore() + newScore) / (userSkill.getId() == null ? 1 : 2)); // Calculate rolling average
        userSkillRepository.save(userSkill);
    }
}
