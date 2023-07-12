package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Model.*;
import Util.DateUtil;
import Util.JdbcUtil;


/**
 * DAO
 */
public class UsersDao {
	public void add(Users model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Users (UserName,Password,ReallyName,ClassName) values('" + model.getUserName() + "','" + model.getPassword() + "','" + model.getReallyName() + "','" + model.getClassName() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Users where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Users model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Users set UserName='" + model.getUserName() + "',Password='" + model.getPassword() + "',ReallyName='" + model.getReallyName() + "',ClassName='" + model.getClassName() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public Users getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Users where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Users model=new Users();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));
			model.setReallyName(rs.getString(4));
			model.setClassName(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Users getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Users where UserName='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Users model=new Users();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));
			model.setReallyName(rs.getString(4));
			model.setClassName(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Users getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Users where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Users model=new Users();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));
			model.setReallyName(rs.getString(4));
			model.setClassName(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Users> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql=" call proc_queryUser() ";
		System.out.println(sql);
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Users> list=new ArrayList<>();
		while(rs.next()) {
			Users model=new Users();
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));
			model.setReallyName(rs.getString(4));
			model.setClassName(rs.getString(5));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Users> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Users where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Users> list=new ArrayList<>();
		while(rs.next()) {
			Users model=new Users();
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));
			model.setReallyName(rs.getString(4));
			model.setClassName(rs.getString(5));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
