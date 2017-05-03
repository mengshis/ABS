package com.cqut.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cqut.Util.DateJsonValueProcessor;
import com.cqut.Util.ResponseUtil;
import com.cqut.Util.StringUtil;
import com.cqut.bean.PageBean;
import com.cqut.bean.User;
import com.cqut.service.IUserService;

	/**
	 * 用户Controller层
	 * @author Administrator
	 *
	 */
	@Controller
	@RequestMapping("/user")
	public class UserController {
		
		@Resource
		private IUserService userService;
		
		@InitBinder
		public void initBinder(WebDataBinder binder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			dateFormat.setLenient(false);
			binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
		}
		
		/**
		 * 用户登录
		 * @param user
		 * @param request
		 * @return
		 * @throws Exception
		 */
		
		@SuppressWarnings("unused")
		@RequestMapping("/login")
		public String login(User user,HttpServletRequest request)throws Exception{
			boolean resultUser=userService.login(user);
			if(false){
				request.setAttribute("user", user);
				request.setAttribute("errorMsg", "用户名或密码错误！");
				return "login";
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("currentUser", resultUser);
				return "redirect:/main.jsp";
			}
		}
		
		
		
		/**
		 * 分页条件查询用户
		 * @param page
		 * @param rows
		 * @param s_user
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/list")
		public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,User s_user,HttpServletResponse response)throws Exception{
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("userName", StringUtil.formatLike(s_user.getLogInName()));
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			List<User> userList=userService.find(map);
			Long total=userService.getTotal(map);
			JSONObject result=new JSONObject();
			JsonConfig jsonConfig=new JsonConfig();
			jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
			JSONArray jsonArray=JSONArray.fromObject(userList,jsonConfig);
			
			result.put("rows", jsonArray);
			result.put("total", total);
			
			ResponseUtil.write(response, result);
			return null;
		}
		
		/**
		 * 添加或者修改用户
		 * @param user
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/save")
		public String save(User user,HttpServletResponse response)throws Exception{
			int resultTotal=0; // 操作的记录条数
			
			if(user.getId()==null){
				resultTotal=userService.save(user);
				
			}else{
				resultTotal=userService.update(user);
			}
			JSONObject result=new JSONObject();
			
			if(resultTotal>0){
				
				result.put("success", true);
			}else{
				result.put("success", false);
				
			}
			ResponseUtil.write(response, result);
			return null;
		}
		
		/**
		 * 删除用户
		 * @param ids
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/delete")
		public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
			String []idsStr=ids.split(",");
			for(int i=0;i<idsStr.length;i++){
				userService.delete(Integer.parseInt(idsStr[i]));
			}
			JSONObject result=new JSONObject();
			result.put("success", true);
			ResponseUtil.write(response, result);
			return null;
		}
		
		/**
		 * 修改用户密码
		 * @param user
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/modifyPassword")
		public String modifyPassword(Integer id,String newPassword,HttpServletResponse response)throws Exception{
			User user=new User();
			user.setId(id);
			user.setPassword(newPassword);
			int resultTotal=userService.update(user);
			JSONObject result=new JSONObject();
			if(resultTotal>0){
				result.put("success", true);
			}else{
				result.put("success", false);
			}
			ResponseUtil.write(response, result);
			return null;
		}
		
		/**
		 * 用户注销
		 * @param session
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/logout")
		public String logout(HttpSession session)throws Exception{
			session.invalidate();
			return "redirect:/login.jsp";
		}
	}

