package com.cqut.service;

import java.util.List;
import java.util.Map;

import com.cqut.bean.User;
/**
 * 用户service
 * @author hshuai
 *
 */
public interface IUserService {
	/**
	 * 用户登录方法
	 * @param user
	 * @return 
	 * 默认false为登录失败
	 */
	
	boolean login(User user);  
	/**
	 * 用户注册  
	 * @param user
	 * @return
	 * 默认false为注册成功
	 */
	boolean register(User user);
	
	/**
	 * 新增用戶
	 * @param user
	 * @return
	 */
	
	int save(User user);
	
	/**
	 * 刪除用戶
	 * @param user
	 * @return
	 */
	int delete(Integer id);
	
	/**
	 * 修改用戶
	 * @return
	 */
	int update(User user);
	
	/**
	 * 查找用户
	 * @param map
	 * @return
	 */
	User select(User user);
	User selectByPrimaryKey(Integer id);
	/**
	 * 查询用户集合
	 * @param map
	 * @return
	 */
	List<User> find(Map<String, Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);
	
}
