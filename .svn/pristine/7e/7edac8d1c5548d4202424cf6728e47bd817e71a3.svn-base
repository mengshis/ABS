package com.cqut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqut.bean.AirBus;
import com.cqut.dao.AirBusMapper;
import com.cqut.service.AirBusService;


/**
 * 客机Service接口
 * @author Administrator
 *
 */
@Service("airbusService")
public class AirBusServiceImpl implements AirBusService{
	@Resource
	private AirBusMapper airBusMapper;

	@Override
	public List<AirBus> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return airBusMapper.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return airBusMapper.getTotal(map);
	}

	
	@Override
	public int add(AirBus airBus) {
		// TODO Auto-generated method stub
		return airBusMapper.insert(airBus);
	}

	@Override
	public int update(AirBus airBus) {
		// TODO Auto-generated method stub
		return airBusMapper.updateByPrimaryKey(airBus);
	}
	
	@Override
	public void delete(int parseInt) {
		// TODO Auto-generated method stub
		airBusMapper.deleteByPrimaryKey(parseInt);
	}

}
