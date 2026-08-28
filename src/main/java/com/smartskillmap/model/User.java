package com.smartskillmap.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(unique = true, nullable = false)
    private String email;

    private String role = "USER";

    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "enrolled_career_id")
    private Long enrolledCareerId;

    @Column(columnDefinition = "TEXT")
    private String progressJson; // Stores Day 1-7 checklist as JSON
}
