package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.bean.bannerBean;

public class bannerDao {
	private static Connection con =null;
	public List<bannerBean> queryBanner() { 
		List<bannerBean> bannerList = new ArrayList<bannerBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from banner where categorize= 't'";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				bannerBean banner = new bannerBean();
				banner.setItemclass(rst.getString("itemclass"));
				banner.setSlide(rst.getString("slide"));
				banner.setBannertitle(rst.getString("bannertitle"));
				banner.setBannername(rst.getString("bannername"));
				banner.setBannercontent(rst.getString("bannercontent"));
				banner.setImg(rst.getString("img"));
				bannerList.add(banner);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return bannerList;
	}
	
	public List<bannerBean> middleBanner() { 
		List<bannerBean> middleList = new ArrayList<bannerBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from banner where categorize= 'm'";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				bannerBean middle = new bannerBean();
				middle.setSlide(rst.getString("slide"));
				middle.setBannertitle(rst.getString("bannertitle"));
				middle.setBannercontent(rst.getString("bannercontent"));
				middleList.add(middle);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return middleList;
	}
	
	public List<bannerBean> bottomBanner() { 
		List<bannerBean> bottomList = new ArrayList<bannerBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from banner where categorize= 'b'";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				bannerBean bottom = new bannerBean();
				bottom.setImg(rst.getString("img"));
				bottom.setUrl(rst.getString("url"));
				bottomList.add(bottom);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return bottomList;
	}
}
