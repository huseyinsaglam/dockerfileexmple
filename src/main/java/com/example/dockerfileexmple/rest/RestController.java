package com.example.dockerfileexmple.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api/v1")
public class RestController {

    @GetMapping("/getMessage1")
    public String getMessage1(){
        return "Hello getMessage 1";
    }

    @GetMapping("/getMessage2")
    public String getMessage2(){
        return "Hello getMessage 2";
    }

    @GetMapping("/getMessage3")
    public String getMessage3(){
        return "Hello getMessage 3";
    }
}
