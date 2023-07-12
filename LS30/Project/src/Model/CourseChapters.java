package Model;

public class CourseChapters {
	private Integer Id;
	private Integer CourseId;
	private String Name;
	private String Remark;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getCourseId() {
		return CourseId;
	}
	public void setCourseId(Integer courseId) {
		CourseId = courseId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}

}
