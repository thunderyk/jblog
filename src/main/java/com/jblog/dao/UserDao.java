package com.jblog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.UserVo;

@Repository
public class UserDao {

	@Autowired SqlSession sqlSession;
	
	public void join(UserVo userVo) {
		System.out.println(userVo.toString());
	}

}
