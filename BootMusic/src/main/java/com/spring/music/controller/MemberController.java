package com.spring.music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.music.domain.Member;
import com.spring.music.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;


@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@PostMapping("/login")
	public String login(Member m, HttpSession session, Model model, RedirectAttributes rttr) {
		Member mem = service.gologin(m);
		if(mem != null) {
			session.setAttribute("id", mem.getId());
			session.setAttribute("nick", mem.getNick());
			System.out.println("성공");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg","로그인 실패");
			return "redirect:/login"; 
		} 
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
