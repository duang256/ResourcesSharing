package cn.wit.service;

import java.util.List;

import cn.wit.pojo.Post;

public interface PostService {
	List<Post> selAllPost();
	List<String> selAllComment(int id);
	void insComment(int pid,String comment);
	void insQuestion(Post post);
	void delPost(int id);
	void delOneComment(String comment);
}
