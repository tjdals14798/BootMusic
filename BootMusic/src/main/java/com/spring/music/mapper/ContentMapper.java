package com.spring.music.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.music.domain.Content;

@Mapper
public interface ContentMapper {

	public void add_PlayList(Content c);
	
}
