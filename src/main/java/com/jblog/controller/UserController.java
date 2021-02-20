package com.jblog.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.service.UserService;
import com.jblog.vo.UserVo;

@Controller
@RequestMapping("usr")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "user/joinForm";
	}
	
	@RequestMapping("join")
	public String join(@ModelAttribute UserVo userVo) {
		
		userService.join(userVo);
		
		return "redirect:./joinSuccess";
	}
	
	@RequestMapping("joinSuccess")
	public String joinSuccessForm() {
		
		return "user/joinSuccess";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		
		return "user/loginForm";
	}
	
	@RequestMapping("login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session, Model model) {
		
		UserVo authVo = userService.login(userVo);
		
		if(authVo != null) {

			session.setAttribute("authMember", authVo);
			
			return "redirect:../"+authVo.getId();
			
		}else {
			//로그인 실패
			return "redirect:loginForm?result=fail";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authMember");
			
		return "redirect:../";
	}

	@RequestMapping("checkId")
	@ResponseBody
	public Map<String,String> checkId(@RequestParam("id") String id	) {
		
		return userService.checkId(id);
	}

}
