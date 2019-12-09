package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.tools.JavaFileObject;

import sun.jdbc.odbc.JdbcOdbcObject;

import com.lw.bean.carBean;
import com.lw.bean.shopCarBean;

public class shopcarDao {
	private static Connection con =null;
	public List<shopCarBean> queryShopCar() { 
		List<shopCarBean> carList = new ArrayList<shopCarBean>();
		Connection con = baseDao.getCon();
		String sql = "select a.goodsid,a.goodsname,a.goodsprice,a.img,count(b.number) number from goods a,car b where a.categorize= 'g' and a.goodsid=b.goodsid group by goodsid";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				shopCarBean car = new shopCarBean();
				car.setGoodsid(rst.getInt("goodsid"));
				car.setGoodsname(rst.getString("goodsname"));
				car.setGoodsprice(rst.getDouble("goodsprice"));
				car.setImg(rst.getString("img"));
				car.setNumber(rst.getInt("number"));
				carList.add(car);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return carList;
	}
	
	public List<shopCarBean> queryCount() { 
		List<shopCarBean> count = new ArrayList<shopCarBean>();
		Connection con = baseDao.getCon();
		String sql = "select sum(number) as count from car";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
			shopCarBean counts = new shopCarBean();
			counts.setCount(rst.getInt("count"));
			count.add(counts);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return count;
	}
	
	public List<shopCarBean> queryTotal() { 
		List<shopCarBean> sum = new ArrayList<shopCarBean>();
		Connection con = baseDao.getCon();
		String sql = "select sum(a.goodsprice) as sum from goods a,car b where a.goodsid = b.goodsid";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
			shopCarBean sums = new shopCarBean();
			sums.setSum(rst.getDouble("sum"));
			sum.add(sums);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return sum;
	}
		
	
}
