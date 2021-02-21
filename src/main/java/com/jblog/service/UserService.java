package com.jblog.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.UserDao;
import com.jblog.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public void join(UserVo userVo) {
		
		userDao.insertUser(userVo);
		userDao.makeBlog(userVo);
		userDao.makeCategory(userVo);
		
	}

	public UserVo login(UserVo userVo) {
		
		return userDao.login(userVo);
	}

	public Map<String,String> checkId(String id) {
		
		UserVo userVo = userDao.checkId(id);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		
		if(userVo == null) {
			map.put("check", "can");
			return map;
		}else {
			map.put("check", "canNot");
			return map;
		}
	}

}
