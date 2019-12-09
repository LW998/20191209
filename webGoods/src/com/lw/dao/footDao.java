package com.lw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lw.bean.footBean;
import com.lw.bean.goodsBean;

public class footDao {
	private static Connection con =null;
	public List<footBean> queryFoot() { 
		List<footBean> footList = new ArrayList<footBean>(); 
		Connection con = baseDao.getCon();
		String sql = "select * from foot";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				footBean foot = new footBean();
				foot.setFootname(rst.getString("footname"));
				foot.setTitleone(rst.getString("titleone"));
				foot.setTitleoneurl(rst.getString("titleoneurl"));
				foot.setTitletwo(rst.getString("titletwo"));
				foot.setTitletwourl(rst.getString("titletwourl"));
				foot.setTitlethree(rst.getString("titlethree"));
				foot.setTitlethreeurl(rst.getString("titlethreeurl"));
				foot.setTitlefour(rst.getString("titlefour"));
				foot.setTitlefoururl(rst.getString("titlefoururl"));
				foot.setTitlefive(rst.getString("titlefive"));
				foot.setTitlefiveurl(rst.getString("titlefiveurl"));
				footList.add(foot);
			}
			rst.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return footList;
	}
}
