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
public class BannersDao {
	public void add(Banners model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into Banners (BannerUrl) values('" + model.getBannerUrl() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from Banners where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(Banners model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update Banners set BannerUrl='" + model.getBannerUrl() + "' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public Banners getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Banners where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Banners model=new Banners();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setBannerUrl(rs.getString(2));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public Banners getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Banners where BannerUrl='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Banners model=new Banners();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setBannerUrl(rs.getString(2));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public Banners getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Banners where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Banners model=new Banners();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setBannerUrl(rs.getString(2));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<Banners> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Banners";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Banners> list=new ArrayList<>();
		while(rs.next()) {
			Banners model=new Banners();
			model.setId(rs.getInt(1));
			model.setBannerUrl(rs.getString(2));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<Banners> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from Banners where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Banners> list=new ArrayList<>();
		while(rs.next()) {
			Banners model=new Banners();
			model.setId(rs.getInt(1));
			model.setBannerUrl(rs.getString(2));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
