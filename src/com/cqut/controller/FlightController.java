package com.cqut.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cqut.Util.DateJsonValueProcessor;
import com.cqut.Util.ResponseUtil;
import com.cqut.Util.StringUtil;
import com.cqut.bean.Flight;
import com.cqut.bean.PageBean;
import com.cqut.service.IFlightService;

@Controller
@RequestMapping("/flight")
public class FlightController {

	@Resource
	IFlightService flightService;

	public HttpServletRequest request;
	public HttpServletResponse response;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true)); // true:允许输入空值，false:不能为空值
	}

	/**
	 * 此方法在control方法执行前执行
	 * 
	 * @param request
	 * @param response
	 */
	@ModelAttribute
	public void setAtrrs(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	/**
	 * 获取航班总的数量
	 */
	@RequestMapping("/getTotal")
	public String getTotal(Map<String,Object> map) {
		flightService.getTotal(map);
		return "page/fligthManager";
	}

	/**
	 * 添加航班
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/add")
	public String add(Flight flight) throws Exception {
		boolean resultTotal = flightService.add(flight);
		JSONObject result = new JSONObject();
		System.out.println("add");
		System.out.println(resultTotal);
		result.put("success", resultTotal);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 删除航班
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(
			@RequestParam(value = "ids", required = true) String ids)
			throws Exception {
		String[] idsStr = ids.split(",");
		boolean resultTotal = false;
		for (int i = 0; i < idsStr.length; i++) {
			resultTotal = flightService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", resultTotal);
		ResponseUtil.write(response, result);
		return null;

	}

	/**
	 * 修改航班信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/update")
	public String update(Flight flight) throws Exception {
		System.out.println("updateFlight");
		boolean resultTotal = flightService.update(flight);
		JSONObject result = new JSONObject();
		result.put("success", resultTotal);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 根据条件查询航班，也可以不输入条件直接查询
	 * 测试中
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/query")
	public String query(String page, String rows, Flight flight) throws Exception {
		/*@RequestParam(value = "page", required = false) 
		@RequestParam(value = "rows", required = false) */
		System.out.println("query");
		System.out.println("page:"+page+" ;rows:"+rows);
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flightId",StringUtil.formatLike(flight.getFlightId()));
		map.put("begin", StringUtil.formatLike(flight.getBegin()));
		map.put("end", StringUtil.formatLike(flight.getEnd()));
		map.put("startTime", flight.getStartTime());
		map.put("reachTime", flight.getReachTime());
		map.put("startAirport", StringUtil.formatLike(flight.getStartAirport()));
		map.put("targetAirport", StringUtil.formatLike(flight.getTargetAirport()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		
		List<Flight> flightList = flightService.query(map);
		JSONObject result = new JSONObject();

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));

		JSONArray jsonArray = JSONArray.fromObject(flightList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", flightService.getTotal(map));
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		return null;
	}
}
