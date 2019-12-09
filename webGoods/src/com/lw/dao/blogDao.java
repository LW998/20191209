package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.bean.blogBean;
import com.lw.bean.goodsBean;

public class blogDao {
	private static Connection con =null;
	public  List<blogBean> queryBolg() { 
		List<blogBean> blogList = new ArrayList<blogBean>();
		Connection con = baseDao.getCon();
		String sql = "select * from blog";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				blogBean blog = new blogBean();
				blog.setBlogtitle(rst.getString("blogtitle"));
				blog.setBlogauthor(rst.getString("blogauthor"));
				blog.setBlogtime(rst.getString("blogtime"));
				blog.setBlogcontent(rst.getString("blogcontent"));
				blog.setImg(rst.getString("img"));
				blog.setArticlesurl(rst.getString("articlesurl"));
				blog.setAuthorurl(rst.getString("authorurl"));
				blogList.add(blog);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return blogList;
	}
}
