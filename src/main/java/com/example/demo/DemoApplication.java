package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
@RestController
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);

	}

	@PostConstruct
    public void init(){
        System.out.println("Demo app started");
    }

	@GetMapping("/")
	public String hello() {
		return "{ \"message\": \"Hello World!\"}";
	}	
}
