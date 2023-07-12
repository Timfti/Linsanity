package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class VideosService {
	
	public List<Videos> queryAll(){
		try {
			return new VideosDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Videos> queryUserAll(int userId){
		try {
			return new VideosDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Videos getById(int id){
		try {
			return new VideosDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Videos getByName(String name){
		try {
			return new VideosDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Videos s) {
		VideosDao sDao =new VideosDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		VideosDao sDao =new VideosDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Videos s) {
		VideosDao sDao =new VideosDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Videos getWhere(String where){
		try {
			return new VideosDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
