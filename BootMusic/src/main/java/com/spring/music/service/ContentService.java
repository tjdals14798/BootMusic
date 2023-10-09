package com.spring.music.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.music.domain.Content;
import com.spring.music.mapper.ContentMapper;

@Service
public class ContentService {
	@Autowired
	private ContentMapper mapper;
	
	public void add_PlayList(Content c) {
		mapper.add_PlayList(c);
	}
	//
	
}