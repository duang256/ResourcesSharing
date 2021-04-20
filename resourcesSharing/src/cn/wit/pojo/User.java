package cn.wit.pojo;

public class User {
	private int id;
	private String username;
	private String password;
	private String registerTime;
	private String centainFields;
	private int sex;
	private String birthday;
	int root;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getCentainFields() {
		return centainFields;
	}
	public void setCentainFields(String centainFields) {
		this.centainFields = centainFields;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public User(int id, String username, String password, String registerTime, String centainFields, int sex,
			String birthday, int root) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.registerTime = registerTime;
		this.centainFields = centainFields;
		this.sex = sex;
		this.birthday = birthday;
		this.root = root;
	}
	public User() {
		super();
	}
	
	
}
