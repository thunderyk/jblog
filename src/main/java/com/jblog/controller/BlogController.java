package com.jblog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jblog.service.BlogService;
import com.jblog.vo.BlogVo;

@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/{userName}")
	public String goBlog(@PathVariable("userName") String id,
						 HttpSession session) {
		
		BlogVo blogVo = blogService.getBlogData(id);
		if(blogVo != null) {
			session.setAttribute("blogVo",blogVo);
			return "blog/blog-main";
		}else {
			return "/error/403"; //블로그 없을경우 안나오게
		}
	}
	@RequestMapping("/{userName}/blog-admin-basic")
	public String blogAdminBasic() {
		
		return "/blog/admin/blog-admin-basic";
		
	}
}
