package cn.wit.pojo;

public class Resource {
	private int id;
	private String name;
	private String type;
	private int root;
	private String html;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getHtml() {
		return html;
	}
	public void setHtml(String html) {
		this.html = html;
	}
	public Resource(int id, String name, String type, int root, String html) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.root = root;
		this.html = html;
	}
	public Resource() {
		super();
	}
	
	
	
	
	
}
