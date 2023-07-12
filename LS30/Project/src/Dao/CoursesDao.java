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
public class CoursesDao {
	public void add(Courses model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Courses (Name,FilePath,TimeLength,Remark) values('" + model.getName() + "','" + model.getFilePath() + "','" + model.getTimeLength() + "','" + model.getRemark() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Courses where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Courses model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Courses set Name='" + model.getName() + "',FilePath='" + model.getFilePath() + "',TimeLength='" + model.getTimeLength() + "',Remark='" + model.getRemark() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public Courses getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Courses where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Courses model=new Courses();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setTimeLength(rs.getString(4));
			model.setRemark(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Courses getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Courses where Name='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Courses model=new Courses();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setTimeLength(rs.getString(4));
			model.setRemark(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Courses getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Courses where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Courses model=new Courses();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setTimeLength(rs.getString(4));
			model.setRemark(rs.getString(5));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Courses> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Courses";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Courses> list=new ArrayList<>();
		while(rs.next()) {
			Courses model=new Courses();
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setTimeLength(rs.getString(4));
			model.setRemark(rs.getString(5));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Courses> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Courses where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Courses> list=new ArrayList<>();
		while(rs.next()) {
			Courses model=new Courses();
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setTimeLength(rs.getString(4));
			model.setRemark(rs.getString(5));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
