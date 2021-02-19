package com.jblog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.BlogVo;
import com.jblog.vo.CategoryVo;
import com.jblog.vo.PostVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	public BlogVo getBlogData(String id) {
		
		return sqlSession.selectOne("blog.getBlogData",id);
	}

	public List<CategoryVo> getCategory(String id) {
		
		return sqlSession.selectList("blog.getCategory",id);
	}

	public List<PostVo> getPostList(int cateNo) {
		
		return sqlSession.selectList("blog.getPostList",cateNo);
	}

	public PostVo getPost(int postNo) {
		
		return sqlSession.selectOne("blog.getPost",postNo);
	}

	public void changeBlogData(BlogVo blogVo) {
		sqlSession.update("blog.changeBlogData");
		
	}
	
}
