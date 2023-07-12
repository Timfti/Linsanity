package Services;

import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Model.*;

public class CourseChaptersService {
	
	public List<CourseChapters> queryAll(){
		try {
			return new CourseChaptersDao().queryAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CourseChapters> queryUserAll(int userId){
		try {
			return new CourseChaptersDao().queryUserAll(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CourseChapters getById(int id){
		try {
			return new CourseChaptersDao().getById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CourseChapters getByName(String name){
		try {
			return new CourseChaptersDao().getByName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(CourseChapters s) {
		CourseChaptersDao sDao =new CourseChaptersDao();
		try {
			sDao.update(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int delete(int id) {
		CourseChaptersDao sDao =new CourseChaptersDao();
		try {
			sDao.detele(id);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}
	
	public int insert(CourseChapters s) {
		CourseChaptersDao sDao =new CourseChaptersDao();
		try {
			sDao.add(s);
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 1001;
		}
	}

	public CourseChapters getWhere(String where){
		try {
			return new CourseChaptersDao().getWhere(where);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
