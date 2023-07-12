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
public class UserTiMusDao {
	public void add(UserTiMus model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into UserTiMus (UserId,Score,AddDate) values('" + model.getUserId() + "','" + model.getScore() + "','" + model.getAddDate() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from UserTiMus where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(UserTiMus model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update UserTiMus set UserId='" + model.getUserId() + "',Score='" + model.getScore() + "',AddDate='" + model.getAddDate() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public UserTiMus getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		UserTiMus model=new UserTiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public UserTiMus getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus where AddDate='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		UserTiMus model=new UserTiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}
	public UserTiMus getNewWhere(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus where userId='"+userId+"' order by id desc LIMIT 1";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		UserTiMus model=new UserTiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	
	public UserTiMus getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		UserTiMus model=new UserTiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<UserTiMus> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<UserTiMus> list=new ArrayList<>();
		while(rs.next()) {
			UserTiMus model=new UserTiMus();
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<UserTiMus> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from UserTiMus where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<UserTiMus> list=new ArrayList<>();
		while(rs.next()) {
			UserTiMus model=new UserTiMus();
			model.setId(rs.getInt(1));
			model.setUserId(rs.getInt(2));
			model.setScore(rs.getInt(3));
			model.setAddDate(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
