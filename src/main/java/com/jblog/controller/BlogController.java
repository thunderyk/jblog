package com.jblog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.service.BlogService;
import com.jblog.vo.BlogVo;
import com.jblog.vo.CategoryVo;
import com.jblog.vo.PostVo;

@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/{userName}")
	public String goBlog(@PathVariable("userName") String id,
						 @RequestParam(name="cateNo", required=false, defaultValue="0") int cateNo,
						 @RequestParam(name="postNo", required=false, defaultValue="0") int postNo,
						 HttpSession session,
						 Model model) {
		
		BlogVo blogVo = blogService.getBlogData(id);
		
		if(blogVo != null) {
			session.setAttribute("blogVo",blogVo);
			
			List<CategoryVo> categoryList = blogService.getCategory(blogVo.getId());
			model.addAttribute("categoryList", categoryList);
			
			List<PostVo> postList;
			if(cateNo == 0) {
				postList = blogService.getPostList(categoryList.get(0).getCateNo());
			}else {
				postList = blogService.getPostList(cateNo);
			}
			
			PostVo postVo = null;
			if(postNo == 0) {
				if(postList.size()>0) {
					postVo = blogService.getPost(postList.get(0).getPostNo());
				}
			}else {
				postVo = blogService.getPost(postNo);
			}
			
			
			model.addAttribute("postList", postList);
			model.addAttribute("postVo", postVo);
			
			return "blog/blog-main";
			
		}else {
			
			return "/error/403"; //블로그 없을경우 안나오게
		}
	}
	@RequestMapping("/{userName}/admin/basic")
	public String blogAdminBasic() {
		
		return "/blog/admin/blog-admin-basic";
		
	}
	
	@RequestMapping("/{userName}/admin/basic/change")
	public String blogAdminBasicChange(@ModelAttribute BlogVo blogVo,
									   MultipartFile file,
									   HttpSession session) {
		
		blogService.changeBlogData(blogVo,file);
		blogVo = blogService.getBlogData(blogVo.getId());
		session.setAttribute("blogVo",blogVo);
		
		return "/blog/admin/blog-admin-basic";
		
	}
	
	@RequestMapping("/{userName}/admin/cate")
	public String blogAdminCate() {
		
		return "/blog/admin/blog-admin-cate";
		
	}
	
	@RequestMapping("/{userName}/admin/write")
	public String blogAdminWrite() {
		
		return "/blog/admin/blog-admin-write";
		
	}
}
