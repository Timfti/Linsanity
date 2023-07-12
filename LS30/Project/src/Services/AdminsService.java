package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class AdminsService {

	public String login(String userName,String password){
		try {
			Admins model = new AdminsDao().getByName(userName);
			if(model == null|| model.getId()<=0) {
				return "用户不存在";
			}
			else {
				System.out.print(model.getPassword());
				if(model.getPassword().equals(password)) {
					return "成功";
				}else {
					return "密码错误";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	public List<Admins> queryAll(){
		try {
			return new AdminsDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Admins> queryUserAll(int userId){
		try {
			return new AdminsDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Admins getById(int id){
		try {
			return new AdminsDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Admins getByName(String name){
		try {
			return new AdminsDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Admins s) {
		AdminsDao sDao =new AdminsDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		AdminsDao sDao =new AdminsDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Admins s) {
		AdminsDao sDao =new AdminsDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Admins getWhere(String where){
		try {
			return new AdminsDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
