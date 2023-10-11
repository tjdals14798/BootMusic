package com.spring.music.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.music.domain.Member;
import com.spring.music.service.MemberService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@PostMapping("/login")
	public String login(Member m, HttpSession session, Model model, RedirectAttributes rttr) {
		Member mem = service.login(m);
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
	
	@PostMapping("/join")
	public String join(@Valid Member m, Errors errors, RedirectAttributes rttr) {
		if(errors.hasErrors()) {
			rttr.addFlashAttribute("joinInfo", m);
			
			Map<String, String> vResult = service.vHandling(errors);
			for(String key : vResult.keySet()) {
				rttr.addFlashAttribute(key, vResult.get(key));
			}
			rttr.addFlashAttribute("jmsg", "가입실패");
			return "redirect:/join";
		}
		
		try {
			service.join(m);
		}catch (Exception e) {
			System.out.println("실패");
			rttr.addFlashAttribute("jmsg", "가입실패");
			return "redirect:/join";
		}
		
		rttr.addFlashAttribute("jmsg", "가입성공");
		return "redirect:/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
