package com.jblog.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.dao.BlogDao;
import com.jblog.vo.BlogVo;
import com.jblog.vo.CategoryVo;
import com.jblog.vo.PostVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	public BlogVo getBlogData(String id) {
		
		return blogDao.getBlogData(id);
	}
	
	public Map<String,Object> goBlog(BlogVo blogVo, int cateNo, int postNo) {
		List<CategoryVo> categoryList = blogDao.getCategory(blogVo.getId());
		
		List<PostVo> postList;
		if(cateNo == 0) {
			postList = blogDao.getPostList(categoryList.get(0).getCateNo());
		}else {
			postList = blogDao.getPostList(cateNo);
		}
		
		PostVo postVo = null;
		if(postNo == 0) {
			if(postList.size()>0) {
				postVo = blogDao.getPost(postList.get(0).getPostNo());
			}
		}else {
			postVo = blogDao.getPost(postNo);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("categoryList", categoryList);
		map.put("postList", postList);
		map.put("postVo", postVo);
		
		return map;
	}
	
	public List<CategoryVo> getCategory(String id) {
		
		return blogDao.getCategory(id);
	}
	public void changeBlogData(BlogVo blogVo, MultipartFile file) {
		
		if(!file.isEmpty()) {
			String saveDir = "D:\\jblog\\FileUp";
			
			String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			
			String logoFile = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
			
			String filePath = saveDir+"\\"+logoFile;
			
			try {
				byte[]fileData = file.getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(out);
				bos.write(fileData);
				bos.close();
				
			}catch(Exception e) {
				System.out.println("FileUpService restore Error: "+e);
			}
			
			blogVo.setLogoFile(logoFile);
		}
		blogDao.changeBlogData(blogVo);
	}

	public List<CategoryVo> getCateWithPost(String id) {
		
		List<CategoryVo> cateList =  blogDao.getCateWithPost(id);
		
		for (int i=0;i<cateList.size();i++) {
			cateList.set(i,blogDao.selectOneCate(cateList.get(i).getCateNo()));	
		}
		
		
		return cateList;
	}

	public CategoryVo addCate(CategoryVo cateVo) {
		
		blogDao.addCate(cateVo);
		return blogDao.selectOneCate(cateVo.getCateNo());
	}

	public void deleteCate(int cateNo) {
		blogDao.deleteCate(cateNo);
		
	}

	public void writePost(PostVo postVo) {
		blogDao.writePost(postVo);
		
	}
}
