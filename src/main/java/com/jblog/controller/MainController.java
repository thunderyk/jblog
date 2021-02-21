package com.jblog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jblog.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/", method= {RequestMethod.GET,RequestMethod.POST})
	public String main( @RequestParam(name="keyword", required=false) String keyword,
			 			@RequestParam(name="kwdOpt", required=false) String kwdOpt,
			 			@RequestParam(name="crtPage", required=false, defaultValue = "1") int crtPage,
			 			Model model) {
		
		Map<String,Object> map = mainService.searchBlog(keyword,kwdOpt,crtPage);
		model.addAttribute("map",map);
		
		
		
		return"main/index";
		
	}
}
