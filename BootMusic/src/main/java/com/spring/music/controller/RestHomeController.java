package com.spring.music.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.music.domain.Content;

@RestController
public class RestHomeController {

	@PostMapping("api/adpl")
	public void add_PlayList(Content content) {
		System.out.println(content.getTitle());
		System.out.println(content.getChannelTitle());
		System.out.println(content.getPublishTime());
		System.out.println(content.getUser());
	}
}
