package com.spring.music.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.spring.music.domain.Member;
import com.spring.music.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public Member login(Member m) {
		return mapper.login(m);
	}
	public void join(Member m) {
		mapper.join(m);
	}
	
	//				회원가입 유효성				//
	@Transactional(readOnly = true)
	public Map<String, String> vHandling(Errors errors){
		Map<String, String> vResult = new HashMap<>();
	
		for(FieldError error : errors.getFieldErrors()) {
			String vName = String.format("valid_%s", error.getField());
			vResult.put(vName, error.getDefaultMessage());
		}
		return vResult;
	}
	
}
