package Util;

import java.sql.*;

public class JdbcUtil {

	public Connection getConn()
	{
		String driverName="com.mysql.jdbc.Driver";
		String dbURL="jdbc:mysql://localhost:3306/EducationMng?characterEncoding=UTF-8";//
		String userName="root";//
		String userPwd="123456";//
	    try
		{
		    Class.forName(driverName);
		}
	    catch(Exception e){
		    e.printStackTrace();
		}
		try{
		    Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
	        return dbConn;
		}
		catch(Exception e)
		{
		    e.printStackTrace();
	        return null;
		}        
	}
	

	public static void release(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

