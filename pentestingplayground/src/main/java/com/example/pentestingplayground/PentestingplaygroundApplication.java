package com.example.pentestingplayground;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class PentestingplaygroundApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PentestingplaygroundApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(PentestingplaygroundApplication.class, args);
	}
}
