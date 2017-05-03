package com.cqut.service;

import java.util.List;
import java.util.Map;

import com.cqut.bean.Flight;

/**
 * 航班service
 * @author yanxiaxu
 *
 */
public interface IFlightService {

	/**
	 * 添加航班方法
	 * @param flight
	 * @return
	 * 返回值为1说明添加成功
	 */
	boolean add(Flight flight);
	
	/**
	 * 删除航班方法
	 * @param flight
	 * @return
	 * 返回值为1说明删除成功
	 */
	boolean delete(Integer id);
	
	/**
	 * 更新航班信息方法
	 * @param flight
	 * @return
	 * 返回值为1说明删除成功
	 */
	boolean update(Flight flight);
	
	/**
	 * 根据条件查询航班方法
	 */
	List<Flight> query(Map<String,Object> map);

	/**
	 * 获取航班总数
	 */
	int getTotal(Map<String,Object> map);
	
}
