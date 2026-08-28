package com.smartskillmap.controller;

import com.smartskillmap.model.*;
import com.smartskillmap.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api/profile")
@CrossOrigin(origins = "*")
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private RecommendationService recommendationService;

    @Autowired
    private com.smartskillmap.repository.CareerPathRepository careerPathRepository;

    @Autowired
    private com.smartskillmap.repository.UserAssessmentRepository userAssessmentRepository;

    @GetMapping("/{userId}")
    public Map<String, Object> getFullProfile(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        if (user == null) return Collections.emptyMap();

        List<UserSkill> skills = userService.getUserSkills(user);
        List<UserAssessment> history = userAssessmentRepository.findByUser(user);
        List<Map<String, Object>> recommendations = recommendationService.getRecommendations(skills);
        
        CareerPath enrolledPath = null;
        if (user.getEnrolledCareerId() != null) {
            enrolledPath = careerPathRepository.findById(user.getEnrolledCareerId()).orElse(null);
        }

        Map<String, Object> profile = new HashMap<>();
        profile.put("user", user);
        profile.put("skills", skills);
        profile.put("history", history);
        profile.put("recommendations", recommendations);
        profile.put("enrolledPath", enrolledPath);
        
        return profile;
    }

    @PostMapping("/{userId}/enroll/{careerId}")
    public Map<String, Object> enroll(@PathVariable Long userId, @PathVariable Long careerId) {
        User user = userService.getUserById(userId);
        if (user != null) {
            user.setEnrolledCareerId(careerId);
            // Progress JSON is no longer cleared here to support multi-track learning!
            userService.updateUser(user);
            return Collections.singletonMap("status", "success");
        }
        return Collections.singletonMap("status", "error");
    }

    @PostMapping("/{userId}/progress")
    public Map<String, Object> updateProgress(@PathVariable Long userId, @RequestBody String progressJson) {
        User user = userService.getUserById(userId);
        if (user != null) {
            user.setProgressJson(progressJson);
            userService.updateUser(user);
            return Collections.singletonMap("status", "success");
        }
        return Collections.singletonMap("status", "error");
    }

    @GetMapping("/{userId}/skills")
    public List<UserSkill> getSkills(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        if (user == null) return Collections.emptyList();
        return userService.getUserSkills(user);
    }

    @GetMapping("/{userId}/history")
    public List<UserAssessment> getHistory(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        if (user == null) return Collections.emptyList();
        return userAssessmentRepository.findByUser(user);
    }

    @GetMapping("/{userId}/recommendations")
    public List<Map<String, Object>> getRecommendations(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        if (user == null) return Collections.emptyList();
        List<UserSkill> skills = userService.getUserSkills(user);
        return recommendationService.getRecommendations(skills);
    }
}
