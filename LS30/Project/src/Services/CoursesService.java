package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class CoursesService {
	
	public List<Courses> queryAll(){
		try {
			return new CoursesDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Courses> queryUserAll(int userId){
		try {
			return new CoursesDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Courses getById(int id){
		try {
			return new CoursesDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Courses getByName(String name){
		try {
			return new CoursesDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(Courses s) {
		CoursesDao sDao =new CoursesDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		CoursesDao sDao =new CoursesDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(Courses s) {
		CoursesDao sDao =new CoursesDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public Courses getWhere(String where){
		try {
			return new CoursesDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
