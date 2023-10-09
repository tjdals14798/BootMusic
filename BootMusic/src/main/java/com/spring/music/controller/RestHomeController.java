package com.spring.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.music.domain.Content;
import com.spring.music.service.ContentService;

@RestController
public class RestHomeController {
	@Autowired
	private ContentService service;

	@PostMapping("api/adpl")
	public void add_PlayList(Content content) {
		System.out.println(content.getVideoId());
		System.out.println(content.getTitle());
		System.out.println(content.getThumbnail());
		System.out.println(content.getChannelTitle());
		System.out.println(content.getPublishTime());
		System.out.println(content.getUser());
		service.add_PlayList(content);
	}
}
