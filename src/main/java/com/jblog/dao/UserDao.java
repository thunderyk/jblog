package com.jblog.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.UserVo;

@Repository
public class UserDao {

	@Autowired 
	private SqlSession sqlSession;
	
	public void join(UserVo userVo) {
		sqlSession.insert("user.join",userVo);
		
		Map<String,Object> blogMap = new HashMap<String,Object>();
		
		blogMap.put("id", userVo.getId());
		blogMap.put("blogTitle", userVo.getUserName()+"의 블로그 입니다.");
		blogMap.put("logoFile", "");
		
		sqlSession.insert("user.makeBlog",blogMap);
		
		Map<String,Object> categoryMap = new HashMap<String,Object>();
		categoryMap.put("id", userVo.getId());
		categoryMap.put("cateName", "미분류");
		categoryMap.put("description", "기본으로 만들어지는 카테고리 입니다.");
		
		sqlSession.insert("user.makeCategory",categoryMap);
	}

	public UserVo login(UserVo userVo) {
		
		return sqlSession.selectOne("login", userVo);
		
	}

}
