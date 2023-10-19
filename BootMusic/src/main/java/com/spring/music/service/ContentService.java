package com.spring.music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.music.domain.Content;
import com.spring.music.mapper.ContentMapper;

@Service
public class ContentService {
	@Autowired
	private ContentMapper mapper;
	
	public void add_PlayList(Content c) { //플레이리스트 목록 추가
		mapper.add_PlayList(c);
	}
	
	public void del_Content(String videoId) { //플레이리스트 목록 삭제
		mapper.del_Content(videoId);
	}
	
	public List<Content> load_PlayList(String user) { //플레이리스트 목록 추가
		return mapper.load_PlayList(user);
	}
	
}