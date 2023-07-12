package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class BannersService {
	
	public List<Banners> queryAll(){
		try {
			return new BannersDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Banners> queryUserAll(int userId){
		try {
			return new BannersDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Banners getById(int id){
		try {
			return new BannersDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Banners getByName(String name){
		try {
			return new BannersDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Banners s) {
		BannersDao sDao =new BannersDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		BannersDao sDao =new BannersDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Banners s) {
		BannersDao sDao =new BannersDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Banners getWhere(String where){
		try {
			return new BannersDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
