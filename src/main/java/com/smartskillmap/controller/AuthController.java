package com.smartskillmap.controller;

import com.smartskillmap.dto.JwtResponse;
import com.smartskillmap.model.User;
import com.smartskillmap.service.UserService;
import com.smartskillmap.util.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtUtils jwtUtils;

    @PostMapping("/signup")
    public ResponseEntity<?> signup(@RequestBody User user) {
        if (userService.findByUsername(user.getUsername()).isPresent()) {
            return ResponseEntity.badRequest().body(Map.of("message", "Username already exists"));
        }
        userService.register(user);
        return ResponseEntity.ok(Map.of("message", "User registered successfully. Please login to continue."));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> credentials) {
        String username = credentials.get("username");
        String password = credentials.get("password");
        
        if (userService.login(username, password)) {
            User user = userService.findByUsername(username).get();
            String token = jwtUtils.generateToken(username);
            return ResponseEntity.ok(new JwtResponse(token, user));
        }
        return ResponseEntity.status(401).body(Map.of("message", "Invalid credentials"));
    }
}

