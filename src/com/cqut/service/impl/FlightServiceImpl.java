package com.cqut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqut.bean.Flight;
import com.cqut.dao.FlightMapper;
import com.cqut.service.IFlightService;

@Service("flightService")
public class FlightServiceImpl implements IFlightService{
	
	//Resource注解
	@Resource
	FlightMapper flightMapper;

	/**
	 * 添加航班方法
	 */
	@Override
	public boolean add(Flight flight) {
		// TODO Auto-generated method stub
		int result = flightMapper.insert(flight);
		if(result == 1)
			return true;
		return false;
	}

	/**
	 * 删除航班方法
	 */
	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		int result = flightMapper.deleteByPrimaryKey(id);
		if(result == 1)
			return true;
		return false;
	}

	/**
	 * 修改航班信息方法
	 */
	@Override
	public boolean update(Flight flight) {
		// TODO Auto-generated method stub
		int result = flightMapper.updateByPrimaryKey(flight);
		if(result == 1)
			return true;
		return false;
	}

	/**
	 * 根据条件查询航班方法
	 */
	@Override
	public List<Flight> query(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return flightMapper.query(map);
	}

	/**
	 * 获取航班总数
	 */
	@Override
	public int getTotal(Map<String,Object> map) {
		return flightMapper.getTotal(map);
	}
	
}
