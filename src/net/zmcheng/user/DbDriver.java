package net.zmcheng.user;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class DbDriver {
	private Connection conn;
	private String url = "jdbc:mysql://localhost/BookStore";
	private String user = "root";
	private String psw = "password";
	public DbDriver() throws ClassNotFoundException, SQLException{
		//注册驱动
	    Class.forName("com.mysql.jdbc.Driver");
	    //建立连接
	    conn = DriverManager.getConnection(url, user, psw);
	}
	public Connection getConnection(){
		return this.conn;
	}
	
}