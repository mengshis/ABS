package com.cqut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqut.bean.User;
import com.cqut.dao.UserMapper;
import com.cqut.service.IUserService;

/**
 *  UserService的实现类
 * @author 
 *
 */
@Service("IUserService")
public class UserServiceImpl implements IUserService{
	//Resource注解
	@Resource
	UserMapper userMapper;
	
	@Override
	public boolean login(User user) {
//		UserBean loginUser=userMapper.login(user);
//		if(loginUser != null)
//			return true;
		return false;
	}

	@Override
	public boolean register(User user) {
//		userMapper.register(user);
		return true;
	}

	@Override
	public int save(User user) {
		
		return userMapper.insert(user);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public User select(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(user.getId());
	}

	@Override
	public List<User> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.getTotal(map);
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

}
