package com.jblog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.service.BlogService;
import com.jblog.vo.BlogVo;
import com.jblog.vo.CategoryVo;
import com.jblog.vo.PostVo;
import com.jblog.vo.UserVo;

@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	//수정 필요 service에서 해줘야할 일로 빼보기
	@RequestMapping("/{userId}")
	public String goBlog(@PathVariable("userId") String id,
						 @RequestParam(name="cateNo", required=false, defaultValue="0") int cateNo,
						 @RequestParam(name="postNo", required=false, defaultValue="0") int postNo,
						 @RequestParam(name="crtPageOfPost", required=false, defaultValue="1") int crtPageOfPost,
						 HttpSession session,
						 Model model) {
		
		BlogVo blogVo = blogService.getBlogData(id);
		
		if(blogVo != null) {
			session.setAttribute("blogVo",blogVo);
			
			Map<String,Object> map = blogService.goBlog(blogVo,cateNo,postNo,crtPageOfPost);
			model.addAttribute("map", map);
			
			return "blog/blog-main";
			
		}else {
			
			return "/error/403"; //블로그 없을경우 안나오게
		}
	}
	@RequestMapping("/{userId}/admin/basic")
	public String blogAdminBasic() {
		
		return "/blog/admin/blog-admin-basic";
		
	}
	
	@RequestMapping("/{userId}/admin/basic/change")
	public String blogAdminBasicChange(@ModelAttribute BlogVo blogVo,
									   MultipartFile file,
									   HttpSession session) {
		
		blogService.changeBlogData(blogVo,file);
		blogVo = blogService.getBlogData(blogVo.getId());
		session.setAttribute("blogVo",blogVo);
		
		return "redirect:./";
		
	}
	
	@RequestMapping("/{userId}/admin/cate")
	public String blogAdminCate() {
		
		return "/blog/admin/blog-admin-cate";
		
	}
	
	@RequestMapping("/{userId}/admin/cate/list")
	@ResponseBody
	public List<CategoryVo> blogAdminCateList(HttpSession session) {
		
		UserVo userVo = (UserVo)session.getAttribute("authMember");
		
		return blogService.getCateWithPost(userVo.getId());
		
	}
	
	@RequestMapping("/{userId}/admin/cate/add")
	@ResponseBody
	public CategoryVo blogAdminCateAdd(@ModelAttribute CategoryVo cateVo) {
		
		return blogService.addCate(cateVo);
		
	}
	
	@RequestMapping("/{userId}/admin/cate/delete")
	@ResponseBody
	public int blogAdminCateDelete(@RequestParam("cateNo") int cateNo) {
		blogService.deleteCate(cateNo);
		
		return cateNo;
		
	}
	
	@RequestMapping("/{userId}/admin/writeForm")
	public String blogAdminWriteForm(HttpSession session,Model model) {
		
		UserVo userVo = (UserVo)session.getAttribute("authMember");
		
		List<CategoryVo> categoryList = blogService.getCategory(userVo.getId());
		model.addAttribute("categoryList",categoryList);
		
		return "/blog/admin/blog-admin-write";
		
	}
	
	@RequestMapping("/{userId}/admin/write")
	public String blogAdminWrite(PostVo postVo) {
		
		blogService.writePost(postVo);
		
		return "redirect:./writeForm";
		
	}
}
