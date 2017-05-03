package com.cqut.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.Util.BaseController;
import com.cqut.Util.DateJsonValueProcessor;
import com.cqut.Util.ResponseUtil;
import com.cqut.bean.Flight;
import com.cqut.bean.Indent;
import com.cqut.service.IFlightService;
import com.cqut.service.IIndentService;

@Controller
@RequestMapping("/page")
public class IndentController extends BaseController {
	@Resource
	private IIndentService indentService;

	@Resource
	private IFlightService flightService;

	private int flight_id;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String index(
			@RequestParam(value = "page", required = false) Integer curPage,
			Model model) {
		if (curPage == null)
			curPage = 1;
		List<Indent> indent = indentService.load(new String[]{"id","indent_number","indent_user_id","user_name","id_card_number","user_telephone","user_email","shipping_type","gate",}, "id", "asc",curPage, PAGE_LIMIT);// 
											// 
		long totalSize = indentService.count();
		int totalPage = (int) Math.ceil(totalSize * 1.0 / PAGE_LIMIT);
		System.out.println("============================================");
		System.out.println(indent);
		model.addAttribute("indents", indent);
		model.addAttribute("totalSize", totalSize);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curPage", curPage);
		return "page/test";
	}

	@RequestMapping("/list")
	public void list(HttpServletResponse response) throws Exception {
		List<Indent> indents = indentService.load();
		System.out.println("indent = " + (indents == null));
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "indent" });
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject result = new JSONObject();
		// Long total=indentService.getTotal(map);
		JSONArray jsonArray = JSONArray.fromObject(indents, jsonConfig);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, result);
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(Indent indent) {
		indentService.save(indent);
	}

	@ResponseBody
	@RequestMapping(value = "/show", method=RequestMethod.GET)
	public String show(int id) {
		Indent indent =  indentService.find(id);
		System.out.println("result = " + indentService.find(id).toString());
		return gson.toJson(indent);
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public void delete(int id) {
		indentService.delete(id);
	}

	@ResponseBody
	@RequestMapping(value = "/update" , method = RequestMethod.POST)
	public String update(Indent indent) {
		indentService.update(indent);
		
		return gson.toJson(indent);
	}

	/*@RequestMapping("/showDetail")
	public Flight showDetail() {
		System.out.println("flight = " + flightService.find(flight_id) == null);
		return flightService.find(flight_id);
	}*/

	@ResponseBody
	@RequestMapping(value = "/deletes", method = RequestMethod.POST)
	public String deletes(@RequestParam("ids[]") List<Integer> ids) {
		for (int id : ids) {
			indentService.delete(id);
		}
		return "{}";
	}
}
