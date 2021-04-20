package cn.wit.pojo;

import java.util.List;

public class Post {
	private int id;
	private String label;
	private String question;
	private List<String> comment;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<String> getComment() {
		return comment;
	}
	public void setComment(List<String> comment) {
		this.comment = comment;
	}
	public Post(int id, String label, String question, List<String> comment) {
		super();
		this.id = id;
		this.label = label;
		this.question = question;
		this.comment = comment;
	}
	public Post() {
		super();
	}
	
	
	
	
}
