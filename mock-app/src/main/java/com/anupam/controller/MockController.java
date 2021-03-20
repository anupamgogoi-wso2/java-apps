package com.anupam.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;

@RestController
public class MockController {

    @GetMapping("/hello")
    public String sayHello() {
        try {
            InetAddress inetAddress = InetAddress.getLocalHost();
            String IP = inetAddress.getHostAddress();
            String result = "Hello from: " + IP;
            System.out.println(result);
            return result;
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
