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
public class CourseChaptersDao {
	public void add(CourseChapters model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into CourseChapters (CourseId,Name,Remark) values('" + model.getCourseId() + "','" + model.getName() + "','" + model.getRemark() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from CourseChapters where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(CourseChapters model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update CourseChapters set CourseId='" + model.getCourseId() + "',Name='" + model.getName() + "',Remark='" + model.getRemark() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public CourseChapters getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from CourseChapters where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		CourseChapters model=new CourseChapters();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setCourseId(rs.getInt(2));
			model.setName(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public CourseChapters getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from CourseChapters where Name='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		CourseChapters model=new CourseChapters();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setCourseId(rs.getInt(2));
			model.setName(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public CourseChapters getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from CourseChapters where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		CourseChapters model=new CourseChapters();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setCourseId(rs.getInt(2));
			model.setName(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<CourseChapters> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from CourseChapters";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<CourseChapters> list=new ArrayList<>();
		while(rs.next()) {
			CourseChapters model=new CourseChapters();
			model.setId(rs.getInt(1));
			model.setCourseId(rs.getInt(2));
			model.setName(rs.getString(3));
			model.setRemark(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<CourseChapters> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from CourseChapters where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<CourseChapters> list=new ArrayList<>();
		while(rs.next()) {
			CourseChapters model=new CourseChapters();
			model.setId(rs.getInt(1));
			model.setCourseId(rs.getInt(2));
			model.setName(rs.getString(3));
			model.setRemark(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
