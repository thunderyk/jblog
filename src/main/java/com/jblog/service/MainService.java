package com.jblog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.BlogDao;
import com.jblog.vo.BlogVo;

@Service
public class MainService {

	@Autowired
	BlogDao blogDao;
	
	public Map<String,Object> searchBlog(String keyword, String kwdOpt,int crtPage) {
		
		if(keyword!=null && keyword!="") {
		
			int listCnt = 5;
			
			crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
			
			int begin= listCnt*(crtPage-1)+1; //해당 페이지의 첫번 째 데이터를 가져오기 위해서 2페이지의 경우 11번부터
			int end=  (listCnt*crtPage); //해당 페이지의 마자막(10번째) 데이터를 가져오기 위해서 2페이지의 경우 20번
			
			List<BlogVo> BlogList = blogDao.searchBlog(keyword, kwdOpt, begin, end);
			
			int pageBtnCount = 5;
			
			int totalCount = blogDao.getTotalBlogCount(keyword, kwdOpt);
			
			int endPageBtnNo = (int)Math.ceil(crtPage/(double)pageBtnCount)*pageBtnCount;
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
			
			Map<String,Object> pMap = new HashMap<String,Object>();
			pMap.put("prev", prev);
			pMap.put("startPageBtnNo", startPageBtnNo);
			pMap.put("endPageBtnNo", endPageBtnNo);
			pMap.put("next", next);
			pMap.put("BlogList", BlogList);
			
			return pMap;
		}else {
			
			return null;
		}
		
	}

}	
