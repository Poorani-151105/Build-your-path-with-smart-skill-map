package com.smartskillmap.controller;

import com.smartskillmap.model.Assessment;
import com.smartskillmap.model.User;
import com.smartskillmap.service.AssessmentService;
import com.smartskillmap.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/assessments")
@CrossOrigin(origins = "*")
public class AssessmentController {

    @Autowired
    private AssessmentService assessmentService;

    @Autowired
    private UserService userService;

    @GetMapping
    public List<Assessment> getAll() {
        return assessmentService.getAllAssessments();
    }

    @PostMapping("/submit")
    public ResponseEntity<?> submitResult(@RequestBody Map<String, Object> payload) {
        Long userId = Long.valueOf(payload.get("userId").toString());
        Long assessmentId = Long.valueOf(payload.get("assessmentId").toString());
        int score = Integer.parseInt(payload.get("score").toString());
        
        User user = new User();
        user.setId(userId);
        
        assessmentService.saveResult(user, assessmentId, score);
        
        return ResponseEntity.ok("Result saved successfully");
    }
}
