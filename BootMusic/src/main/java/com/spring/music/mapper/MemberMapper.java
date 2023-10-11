package com.spring.music.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.music.domain.Member;

@Mapper
public interface MemberMapper {

	public Member login(Member m);
	
	public void join(Member m);

}
