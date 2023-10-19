package com.spring.music.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.music.domain.Content;

@Mapper
public interface ContentMapper {

	public void add_PlayList(Content c);
	
	public void del_Content(String videoId);
	
	public List<Content> load_PlayList(String user);
	
}
