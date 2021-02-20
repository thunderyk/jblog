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
	
	public Map<String,Object> goBlog(BlogVo blogVo, int cateNo, int postNo, int crtPageOfPost) {
		List<CategoryVo> categoryList = blogDao.getCategory(blogVo.getId());
		
		List<PostVo> postList;
		
		int listCnt = 5;
		
		crtPageOfPost = (crtPageOfPost > 0) ? crtPageOfPost : (crtPageOfPost = 1);
		
		int begin= listCnt*(crtPageOfPost-1)+1; //해당 페이지의 첫번 째 데이터를 가져오기 위해서 2페이지의 경우 11번부터
		int end=  (listCnt*crtPageOfPost); //해당 페이지의 마자막(10번째) 데이터를 가져오기 위해서 2페이지의 경우 20번
		
		int pageBtnCount = 5;
		int totalCount;
		
		
		if(cateNo == 0) {
			postList = blogDao.getPostList(categoryList.get(0).getCateNo(),begin,end);
			totalCount = blogDao.getTotalCountOfPost(categoryList.get(0).getCateNo());
		}else {
			postList = blogDao.getPostList(cateNo,begin,end);
			totalCount = blogDao.getTotalCountOfPost(cateNo);
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
		
		int endPageBtnNo = (int)Math.ceil(crtPageOfPost/(double)pageBtnCount)*pageBtnCount;
		int startPageBtnNo = endPageBtnNo - (pageBtnCount - 1);
		
		boolean next;
		
		if(endPageBtnNo * listCnt < totalCount) {
			next = true;
		}else {
			next = false;
			endPageBtnNo = (int)Math.ceil(totalCount/(double)listCnt);
		}
		
		boolean prev;
		
		if(startPageBtnNo != 1) {
			prev = true;
		}else {
			prev = false;
		}
		
		map.put("prev", prev);
		map.put("startPageBtnNo", startPageBtnNo);
		map.put("endPageBtnNo", endPageBtnNo);
		map.put("next", next);
		
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
