package com.smartskillmap.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "assessments")
@Data
public class Assessment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(name = "category")
    private String category;

    @Column(columnDefinition = "JSON")
    private String questionsJson;

    @Column(name = "target_skill_name")
    private String targetSkillName;
}
