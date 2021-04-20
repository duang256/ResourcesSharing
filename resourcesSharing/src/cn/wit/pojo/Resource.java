package cn.wit.pojo;

public class Resource {
	private int id;
	private String name;
	private String type;
	private String url;
	private int root;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public Resource() {
		super();
	}
	public Resource(int id, String name, String type, String url, int root) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.url = url;
		this.root = root;
	}
	
}
