package com.smartskillmap.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "career_paths")
@Data
public class CareerPath {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;

    @Column(columnDefinition = "JSON")
    private String roadmapJson;

    @Column(name = "daily_track_json", columnDefinition = "TEXT")
    private String dailyTrackJson;

    @Column(columnDefinition = "JSON")
    private String requirementJson;

    @Column(name = "sub_domain")
    private String subDomain;

    @Column(columnDefinition = "JSON")
    private String coursesJson;

    @Column(name = "path_type")
    private String pathType;

    @Column(name = "domain_category")
    private String domainCategory;
}
