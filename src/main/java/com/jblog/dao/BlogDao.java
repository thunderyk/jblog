package com.jblog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<PostVo> getPostList(int cateNo,int begin, int end) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cateNo", cateNo);
		map.put("begin", begin);
		map.put("end",end);
		
		return sqlSession.selectList("blog.getPostList",map);
	}

	public PostVo getPost(int postNo) {
		
		return sqlSession.selectOne("blog.getPost",postNo);
	}

	public void changeBlogData(BlogVo blogVo) {
		sqlSession.update("blog.changeBlogData", blogVo);
		
	}

	public List<CategoryVo> getCateWithPost(String id) {
		
		return sqlSession.selectList("blog.getCategory",id);
	}

	public void addCate(CategoryVo cateVo) {
		
		sqlSession.insert("blog.addCate",cateVo);
		
	}

	public CategoryVo selectOneCate(int cateNo) {
		
		return sqlSession.selectOne("blog.getCateOne",cateNo);
	}

	public void deleteCate(int cateNo) {
		sqlSession.delete("blog.deleteCate",cateNo);
		
	}

	public void writePost(PostVo postVo) {
		sqlSession.insert("blog.insertPost",postVo);
		
	}

	public int getTotalCountOfPost(int cateNo) {
		return sqlSession.selectOne("blog.totalPostCount",cateNo);
		
	}
	
}
