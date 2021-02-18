package com.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.UserDao;
import com.jblog.vo.UserVo;

@Service
public class UserService {

	@Autowired
	UserDao userDao;
	
	public void join(UserVo userVo) {
		
		userDao.join(userVo);
		
	}

}
