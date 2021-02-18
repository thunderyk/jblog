package com.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.BlogDao;
import com.jblog.vo.BlogVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	public BlogVo getBlogData(String id) {
		
		return blogDao.getBlogData(id);
	}
}
