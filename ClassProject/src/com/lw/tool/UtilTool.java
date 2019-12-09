package com.lw.tool;

public class UtilTool {
	public static String getUTF(String oldISO) {
		String result = "";
		try {
			result = new String(oldISO.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {
			result = "转码失败" + e.getMessage();
		}
		return result;
	}
}
