package com.jblog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.BlogVo;
import com.jblog.vo.CategoryVo;
import com.jblog.vo.CommentVo;
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

	public void insertComment(CommentVo commentVo) {
		sqlSession.insert("blog.insertComment",commentVo);
		
	}

	public CommentVo selectComment(CommentVo commentVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("blog.selectComment",commentVo.getCmtNo());
	}

	public List<CommentVo> getAllComment(int postNo) {
		
		return sqlSession.selectList("blog.getAllList",postNo);
	}

	public void deleteComment(int cmtNo) {
		sqlSession.delete("blog.deleteComment",cmtNo);
		
	}

	public List<BlogVo> searchBlog(String keyword, String kwdOpt, int begin, int end) {

		Map<String,Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("kwdOpt", kwdOpt);
		map.put("begin", begin);
		map.put("end", end);
		
		return sqlSession.selectList("blog.getBlogList",map);
	}

	public int getTotalBlogCount(String keyword, String kwdOpt) {

		Map<String,Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("kwdOpt", kwdOpt);
		
		return sqlSession.selectOne("blog.getTotlaBlog",map);
	}

	public int postCountInCate(int cateNo) {
		
		return sqlSession.selectOne("blog.hasPost",cateNo);
	}

	public void deleteAllComment(int postNo) {
		sqlSession.delete("blog.deleteAllComment",postNo);
		
	}

	public void deletePost(int postNo) {
		sqlSession.delete("blog.deletePost",postNo);
		
	}
	
}
