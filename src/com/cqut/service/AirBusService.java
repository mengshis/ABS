package com.cqut.service;

import java.util.List;
import java.util.Map;

import com.cqut.bean.AirBus;




/**
 * 客户Service接口
 * @author Administrator
 *
 */
public interface AirBusService {

	/**
	 * 查询客机集合
	 * @param map
	 * @return
	 */
	public List<AirBus> find(Map<String,Object> map);

	public Long getTotal(Map<String, Object> map);

	public void delete(int parseInt);

	public int add(AirBus airBus);

	public int update(AirBus airBus);

}
