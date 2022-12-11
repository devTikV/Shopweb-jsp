package com.mt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ASMApplication {

	public static void main(String[] args) {
		SpringApplication.run(ASMApplication.class, args);
	}

}
