package com.spring.music.controller;

import java.util.List;

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
		service.add_PlayList(content);
	}
	
	@PostMapping("api/loadList")
	public List<Content> load_PlayList(String user){
		return service.load_PlayList(user);
	}
	
	@PostMapping("api/delContent")
	public void del_PlayList(String videoId) {
		service.del_Content(videoId);
	}
}
