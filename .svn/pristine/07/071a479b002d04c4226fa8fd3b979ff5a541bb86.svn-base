package com.cqut.Util;

import java.text.SimpleDateFormat;

public class SQLUtil {

	/**
	 * 格式化字段
	 * 
	 * @param parameters
	 *            字段
	 * @return 格式化结果
	 */
	public static String formatParameters(String[] parameters) {
		if(parameters == null)
			return null;
		StringBuilder stringBuilder = new StringBuilder();

		stringBuilder.append(parameters[0]);
		for (int i = 1, length = parameters.length; i < length; i++) {
			stringBuilder.append("," + parameters[i]);
		}
		
		return stringBuilder.toString();
	}

	/**
	 * 条件SQL参数填充
	 * 
	 * @param condition
	 *            条件
	 * @param values
	 *            参数
	 * @return 条件SQL
	 */
	@SuppressWarnings("deprecation")
	public static String fillCondition(String condition, Object[] values) {
		StringBuilder stringBuilder = new StringBuilder(condition);

		for (int i = 0, length = values.length; i < length; i++) {
			int index = stringBuilder.indexOf("?");
			Object value = values[i];
			String param;
			if (value instanceof String) {
				param = "'" + ((String) value).replaceAll("'", "''") + "'";
			} else if (value instanceof java.util.Date) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				param = "'" + simpleDateFormat.format((java.util.Date) value)
						+ "'";
			} else if (value instanceof java.sql.Date) {
				param = "'" + ((java.sql.Date) value).toLocaleString() + "'";
			} else {
				param = value.toString();
			}
			stringBuilder.replace(index, index + 1, param);
		}

		return stringBuilder.toString();
	}

	public static int getOffset(int curPage, int limit) {
		return (curPage - 1) * limit;
	}
}
