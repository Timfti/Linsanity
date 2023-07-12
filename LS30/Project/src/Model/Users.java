package Model;

public class Users {
	private Integer Id;
	private String UserName;
	private String Password;
	private String ReallyName;
	private String ClassName;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getReallyName() {
		return ReallyName;
	}
	public void setReallyName(String reallyName) {
		ReallyName = reallyName;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}

}
