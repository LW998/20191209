package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class carDao {
	private static Connection con =null;
	public boolean add(Integer goodsid) { 
		Connection con = baseDao.getCon();
		String sql = "insert into car(goodsid,number,time) values (?,?,now())";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1,goodsid);
			pst.setInt(2,1);
			int count=pst.executeUpdate();//执行语句 
			if(count>0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return true;
	}
	
	public boolean delete(Integer goodsid) { 
		Connection con = baseDao.getCon();
		String sql = "delete from car where time IN ( SELECT * FROM ( SELECT MAX( time ) FROM car where goodsid=? ) a ) ";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1,goodsid);
			int count=pst.executeUpdate();//执行语句 
			if(count>0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return true;
	}
	
}
