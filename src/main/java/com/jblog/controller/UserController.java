package com.jblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jblog.service.UserService;
import com.jblog.vo.UserVo;

@Controller
@RequestMapping("usr")
public class UserController {

	@Autowired UserService userService;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "user/joinForm";
	}
	
	@RequestMapping("join")
	public String join(@ModelAttribute UserVo userVo) {
		
		userService.join(userVo);
		
		
		return "redirect:../";
	}
	
}
