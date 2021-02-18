package com.jblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("usr")
public class UserController {

	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "user/joinForm";
	}
	
	@RequestMapping("join")
	public String join() {
		
		
		
		return "redirect:../";
	}
	
}
