package com.cqut.service;

import java.util.List;

import com.cqut.bean.Indent;


public interface IIndentService {
	// 保存订单
	void save(Indent order);

	// 根据id删除订单
	void delete(int id);

	// 修改订单
	void update(Indent order);

	// 根据id查询订单
	Indent find(int id);

	// 撤销订单
	void undo(int id);

	// 统计数量
	long count();

	long count(String condition, Object[] values);

	long count(String[] parameters, boolean isDistinct);

	long count(String[] parameters, String condition, Object[] values,
			boolean isDistinct);

	List<Indent> load();

	List<Indent> load(String[] parameters, String order, String sort,
			int curPage, int limit);

	List<Indent> load(String[] parameters, String condition, Object[] values, String order, String sort, int curPage, int limit);
}
