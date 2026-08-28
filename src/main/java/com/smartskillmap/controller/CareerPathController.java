package com.smartskillmap.controller;

import com.smartskillmap.model.CareerPath;
import com.smartskillmap.repository.CareerPathRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/careers")
@CrossOrigin(origins = "*")
public class CareerPathController {

    @Autowired
    private CareerPathRepository careerPathRepository;

    @GetMapping
    public List<CareerPath> getAll() {
        return careerPathRepository.findAll();
    }
}
