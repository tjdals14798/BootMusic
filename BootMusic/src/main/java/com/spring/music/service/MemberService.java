package com.spring.music.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.music.domain.Member;
import com.spring.music.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public Member gologin(Member m) {
		return mapper.login(m);
	}
}
