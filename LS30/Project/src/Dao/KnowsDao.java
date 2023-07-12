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
public class KnowsDao {
	public void add(Knows model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Knows (Title,Remark) values('" + model.getTitle() + "','" + model.getRemark() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Knows where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Knows model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Knows set Title='" + model.getTitle() + "',Remark='" + model.getRemark() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}

	public int getCount() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select count(0) 'cnt' from Knows";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int cnt =0;
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		JdbcUtil.release(conn);
		return cnt;
	}

	public Knows getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Knows where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Knows model=new Knows();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTitle(rs.getString(2));
			model.setRemark(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Knows getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Knows where Title='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Knows model=new Knows();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTitle(rs.getString(2));
			model.setRemark(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Knows getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Knows where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Knows model=new Knows();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTitle(rs.getString(2));
			model.setRemark(rs.getString(3));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Knows> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Knows";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Knows> list=new ArrayList<>();
		while(rs.next()) {
			Knows model=new Knows();
			model.setId(rs.getInt(1));
			model.setTitle(rs.getString(2));
			model.setRemark(rs.getString(3));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Knows> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Knows where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Knows> list=new ArrayList<>();
		while(rs.next()) {
			Knows model=new Knows();
			model.setId(rs.getInt(1));
			model.setTitle(rs.getString(2));
			model.setRemark(rs.getString(3));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Knows> getPage(int page, int limit) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		page = (page-1) * limit;
		String sql="select * from Knows limit "+page+","+limit;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Knows> list=new ArrayList<>();
		while(rs.next()) {
			Knows model=new Knows();
			model.setId(rs.getInt(1));

			String title = rs.getString(2).trim();
			model.setTitle(title);
			
			String remark = rs.getString(3).trim();
			model.setRemark(remark);

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}
}
