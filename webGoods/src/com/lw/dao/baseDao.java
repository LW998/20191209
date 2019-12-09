package com.lw.dao;

import java.sql.*;

public class baseDao { 
	private static String url = "jdbc:mysql://localhost:3306/webgoods"; // 数据库地址
	private static String userName = "root"; // 数据库用户名
	private static String passWord = "root"; // 数据库密码
	private static Connection con = null;  //
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, userName, passWord);
			//System.out.println("数据库连接成功！");
			return con;
		} catch (Exception e) {
			System.out.println("数据库连接失败！");
			e.printStackTrace();
			return null;
		}
	}
	public static void close(Connection con)
    {    
        if(con!=null)    
        {    
            try 
            {    
                con.close();    
            } catch (SQLException e) {
                e.printStackTrace();    
            }    
        }    
    }
	public static void main(String[] args) { 
		System.out.println(getCon());
	}

}
