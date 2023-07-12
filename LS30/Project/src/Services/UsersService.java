package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class UsersService {

	public String login(String userName,String password){
		try {
			Users model = new UsersDao().getByName(userName);
			if(model == null|| model.getId()<=0) {
				return "用户不存在";
			}
			else {
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
	public List<Users> queryAll(){
		try {
			return new UsersDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Users> queryUserAll(int userId){
		try {
			return new UsersDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Users getById(int id){
		try {
			return new UsersDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Users getByName(String name){
		try {
			return new UsersDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Users s) {
		UsersDao sDao =new UsersDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		UsersDao sDao =new UsersDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Users s) {
		UsersDao sDao =new UsersDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Users getWhere(String where){
		try {
			return new UsersDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
