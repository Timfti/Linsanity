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
public class VideosDao {
	public void add(Videos model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Videos (Name,FilePath,Remark) values('" + model.getName() + "','" + model.getFilePath() + "','" + model.getRemark() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Videos where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Videos model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Videos set Name='" + model.getName() + "',FilePath='" + model.getFilePath() + "',Remark='" + model.getRemark() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public Videos getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Videos where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Videos model=new Videos();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Videos getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Videos where Name='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Videos model=new Videos();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Videos getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Videos where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Videos model=new Videos();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setRemark(rs.getString(4));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Videos> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Videos";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Videos> list=new ArrayList<>();
		while(rs.next()) {
			Videos model=new Videos();
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setRemark(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Videos> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Videos where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Videos> list=new ArrayList<>();
		while(rs.next()) {
			Videos model=new Videos();
			model.setId(rs.getInt(1));
			model.setName(rs.getString(2));
			model.setFilePath(rs.getString(3));
			model.setRemark(rs.getString(4));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
