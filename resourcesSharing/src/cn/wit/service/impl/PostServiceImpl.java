package cn.wit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import cn.wit.mapper.PostMapper;
import cn.wit.pojo.Post;
import cn.wit.service.PostService;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostMapper postMapper;
	
	@Override
	public List<Post> selAllPost() {
		return postMapper.selAllPost();
	}

	@Override
	public List<String> selAllComment(int id) {
		return postMapper.selAllComment(id);
	}

	@Override
	public void insComment(int pid, String comment) {
		postMapper.insComment(pid, comment);
	}

	@Override
	public void insQuestion(Post post) {
		postMapper.insPost(post);
	}

	@Override
	public void delPost(int id) {
		postMapper.delPost(id);
		postMapper.delAllCommentByPid(id);
	}

	@Override
	public void delOneComment(String comment) {
		postMapper.delCommentById(comment);
	}

}
