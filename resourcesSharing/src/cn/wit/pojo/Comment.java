package cn.wit.pojo;

public class Comment {
	private int id;
	private int pid;
	private String comment;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Comment(int id, int pid, String comment) {
		super();
		this.id = id;
		this.pid = pid;
		this.comment = comment;
	}
	public Comment() {
		super();
	}
	
}
