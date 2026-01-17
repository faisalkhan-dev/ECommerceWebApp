package com.project.ecom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.project.ecom")
@EnableJpaRepositories(basePackages = "com.project.ecom")
public class WebStoreApplication {
    public static void main(String[] args) {

        SpringApplication.run(WebStoreApplication.class, args);
    }

}
