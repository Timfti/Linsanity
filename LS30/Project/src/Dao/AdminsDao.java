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
public class AdminsDao {
	public void add(Admins model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Admins (UserName,Password) values('" + model.getUserName() + "','" + model.getPassword() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Admins where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Admins model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Admins set UserName='" + model.getUserName() + "',Password='" + model.getPassword() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public Admins getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Admins where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Admins model=new Admins();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Admins getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Admins where UserName='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Admins model=new Admins();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Admins getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Admins where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Admins model=new Admins();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Admins> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Admins";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Admins> list=new ArrayList<>();
		while(rs.next()) {
			Admins model=new Admins();
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Admins> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Admins where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Admins> list=new ArrayList<>();
		while(rs.next()) {
			Admins model=new Admins();
			model.setId(rs.getInt(1));
			model.setUserName(rs.getString(2));
			model.setPassword(rs.getString(3));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
