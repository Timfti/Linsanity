package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class KnowsService {
	
	public List<Knows> queryAll(){
		try {
			return new KnowsDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Knows> queryUserAll(int userId){
		try {
			return new KnowsDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Knows> getPage(int page, int limit){
		try {
			return new KnowsDao().getPage(page, limit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getCount(){
		try {
			return new KnowsDao().getCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Knows getById(int id){
		try {
			return new KnowsDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Knows getByName(String name){
		try {
			return new KnowsDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Knows s) {
		KnowsDao sDao =new KnowsDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		KnowsDao sDao =new KnowsDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Knows s) {
		KnowsDao sDao =new KnowsDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Knows getWhere(String where){
		try {
			return new KnowsDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
