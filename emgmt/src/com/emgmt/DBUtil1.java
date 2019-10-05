package com.emgmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class DBUtil1 {
	public static Connection getOracleConnection()throws ClassNotFoundException , SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","Newuser123");
		System.out.println("Connected Successfully");
		return con;
	}
}