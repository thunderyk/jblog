package com.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.UserDao;
import com.jblog.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public void join(UserVo userVo) {
		
		userDao.join(userVo);
		
	}

	public UserVo login(UserVo userVo) {
		
		return userDao.login(userVo);
	}

}
