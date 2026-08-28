package com.smartskillmap.service;

import com.smartskillmap.model.CareerPath;
import com.smartskillmap.model.UserSkill;
import com.smartskillmap.repository.CareerPathRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class RecommendationService {

    @Autowired
    private CareerPathRepository careerPathRepository;

    private final ObjectMapper objectMapper = new ObjectMapper();

    public List<Map<String, Object>> getRecommendations(List<UserSkill> userSkills) {
        List<CareerPath> careers = careerPathRepository.findAll();
        List<Map<String, Object>> recommendations = new ArrayList<>();

        for (CareerPath career : careers) {
            try {
                Map<String, Integer> requirements = objectMapper.readValue(career.getRequirementJson(), 
                        new TypeReference<Map<String, Integer>>() {});
                
                double totalMatch = 0;
                int count = 0;

                for (Map.Entry<String, Integer> req : requirements.entrySet()) {
                    String skillName = req.getKey();
                    int reqScore = req.getValue();
                    
                    int userScore = userSkills.stream()
                            .filter(us -> us.getSkill().getName().equalsIgnoreCase(skillName))
                            .map(UserSkill::getScore)
                            .findFirst()
                            .orElse(0);
                    
                    // Match score: userScore / reqScore (capped at 1.0)
                    double match = Math.min(1.0, (double) userScore / reqScore);
                    totalMatch += match;
                    count++;
                }

                double finalMatchPercentage = (count > 0) ? (totalMatch / count) * 100 : 0;

                Map<String, Object> rec = new HashMap<>();
                rec.put("career", career);
                rec.put("matchPercentage", Math.round(finalMatchPercentage * 100.0) / 100.0);
                recommendations.add(rec);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Sort by match percentage descending
        recommendations.sort((a, b) -> Double.compare((double) b.get("matchPercentage"), (double) a.get("matchPercentage")));
        
        return recommendations;
    }
}
