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
public class TiMusDao {
	public void add(TiMus model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="insert into TiMus (TypeName,UnitName,NanYiDu,Name,Score,A,B,C,D,IsRight) values('" + model.getTypeName() + "','" + model.getUnitName() + "','" + model.getNanYiDu() + "','" + model.getName() + "','" + model.getScore() + "','"+model.getA()+"','"+model.getB()+"','"+model.getC()+"','"+model.getD()+"','"+model.getIsRight()+"');";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}

	public void detele(int id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="delete from TiMus where id = " + id;
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}


	public void update(TiMus model) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="update TiMus set TypeName='" + model.getTypeName() + "',UnitName='" + model.getUnitName() + "',NanYiDu='" + model.getNanYiDu() + "',Name='" + model.getName() + "',Score='" + model.getScore() + "',A='"+model.getA()+"',B='"+model.getB()+"',C='"+model.getC()+"',D='"+model.getD()+"',IsRight='"+model.getIsRight()+"' where Id = "+ model.getId();
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		JdbcUtil.release(conn);
	}



	public TiMus getById(int Id) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus where Id="+Id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		TiMus model=new TiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public TiMus getByName(String name) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus where Name='"+name+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		TiMus model=new TiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

		}
		JdbcUtil.release(conn);
		return model;
	}
	
	public TiMus getWhere(String where) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus where "+ where;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		TiMus model=new TiMus();
		while(rs.next()) {
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

		}
		JdbcUtil.release(conn);
		return model;
	}

	public List<TiMus> queryAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TiMus> list=new ArrayList<>();
		while(rs.next()) {
			TiMus model=new TiMus();
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<TiMus> queryRandomAll() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus ORDER BY RAND() LIMIT 10";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TiMus> list=new ArrayList<>();
		while(rs.next()) {
			TiMus model=new TiMus();
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<TiMus> queryUserAll(int userId) throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select * from TiMus where userId ="+ userId;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TiMus> list=new ArrayList<>();
		while(rs.next()) {
			TiMus model=new TiMus();
			model.setId(rs.getInt(1));
			model.setTypeName(rs.getString(2));
			model.setUnitName(rs.getString(3));
			model.setNanYiDu(rs.getString(4));
			model.setName(rs.getString(5));
			model.setScore(rs.getInt(6));
			model.setA(rs.getString(7));
			model.setB(rs.getString(8));
			model.setC(rs.getString(9));
			model.setD(rs.getString(10));
			model.setIsRight(rs.getString(11));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

	public List<TiMus> getUnitList() throws SQLException {
		JdbcUtil jdbc = new JdbcUtil();
		Connection conn = jdbc.getConn();
		String sql="select unitName from TiMus group by unitName";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TiMus> list=new ArrayList<>();
		while(rs.next()) {
			TiMus model=new TiMus();
			model.setUnitName(rs.getString(1));

			list.add(model);
		}
		JdbcUtil.release(conn);
		return list;
	}

}
