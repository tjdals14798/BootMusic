package com.spring.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {

	@GetMapping("/")
	public String Home() {
		return "search";
	}
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
	@GetMapping("/playlist")
	public String playlist() {
		return "playlist";
	}
	@GetMapping("/join")
	public String join() {
		return "join";
	}
}
