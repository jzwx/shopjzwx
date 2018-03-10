package com.shopjzwx;
import java.sql.*;
public class DataBase {
	public static Connection getConnection()
	{
		Connection cn=null;
		try
		{
			Class.forName("org.gjt.mm.mysql.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jzwx","root","123456");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;
	}
}
