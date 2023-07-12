package Model;

public class Courses {
	private Integer Id;
	private String Name;
	private String FilePath;
	private String TimeLength;
	private String Remark;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getFilePath() {
		return FilePath;
	}
	public void setFilePath(String filePath) {
		FilePath = filePath;
	}
	public String getTimeLength() {
		return TimeLength;
	}
	public void setTimeLength(String timeLength) {
		TimeLength = timeLength;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}

}
