package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class TiMusService {
	
	public List<TiMus> queryAll(){
		try {
			return new TiMusDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<TiMus> queryRandomAll(){
		try {
			return new TiMusDao().queryRandomAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<TiMus> queryUserAll(int userId){
		try {
			return new TiMusDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<TiMus> getUnitList(){
		try {
			return new TiMusDao().getUnitList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public TiMus getById(int id){
		try {
			return new TiMusDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public TiMus getByName(String name){
		try {
			return new TiMusDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(TiMus s) {
		TiMusDao sDao =new TiMusDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		TiMusDao sDao =new TiMusDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(TiMus s) {
		TiMusDao sDao =new TiMusDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public TiMus getWhere(String where){
		try {
			return new TiMusDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
