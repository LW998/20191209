package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.bean.goodsBean;

public class goodsDao {
	private static Connection con =null;
	public List<goodsBean> queryGoods() { 
		List<goodsBean> goodsList = new ArrayList<goodsBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from goods where categorize= 'g'";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				goodsBean goods = new goodsBean();
				goods.setGoodsid(rst.getInt("goodsid"));
				goods.setGoodsname(rst.getString("goodsname"));
				goods.setGoodsprice(rst.getDouble("goodsprice"));
				goods.setImg(rst.getString("img"));
				goodsList.add(goods);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return goodsList;
	}
	
	public List<goodsBean> queryFeature() { 
		List<goodsBean> featureList = new ArrayList<goodsBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from goods where categorize= 'f' ";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				goodsBean feature = new goodsBean();
				feature.setGoodsid(rst.getInt("goodsid"));
				feature.setGoodsname(rst.getString("goodsname"));
				feature.setGoodsprice(rst.getDouble("goodsprice"));
				feature.setImg(rst.getString("img"));
				feature.setUrl(rst.getString("url"));
				featureList.add(feature);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return featureList;
	}
}
