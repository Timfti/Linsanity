package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class UserTiMusService {
	
	public List<UserTiMus> queryAll(){
		try {
			return new UserTiMusDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<UserTiMus> queryUserAll(int userId){
		try {
			return new UserTiMusDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public UserTiMus getById(int id){
		try {
			return new UserTiMusDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public UserTiMus getByName(String name){
		try {
			return new UserTiMusDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public UserTiMus getNewWhere(int userId){
		try {
			return new UserTiMusDao().getNewWhere(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public int update(UserTiMus s) {
		UserTiMusDao sDao =new UserTiMusDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		UserTiMusDao sDao =new UserTiMusDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(UserTiMus s) {
		UserTiMusDao sDao =new UserTiMusDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public UserTiMus getWhere(String where){
		try {
			return new UserTiMusDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
