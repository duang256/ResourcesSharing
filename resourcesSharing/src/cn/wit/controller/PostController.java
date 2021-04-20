package cn.wit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wit.pojo.Post;
import cn.wit.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	
	@RequestMapping("/comment")
	@ResponseBody
	public List<Post> addComment(int pid,String comment,HttpServletRequest request){
		System.out.println(pid);
		System.out.println(pid);
		System.out.println(pid);
		System.out.println(pid);
		System.out.println(comment);
		System.out.println(comment);
		System.out.println(comment);
		System.out.println(comment);
		//��������
		postService.insComment(pid,comment);
		
		//������̳
		List<Post> posts = postService.selAllPost();
		for (Post post : posts) {
			List<String> comments = postService.selAllComment(post.getId());
			post.setComment(comments);
		}
		request.setAttribute("posts", posts);
		return posts;
	}
	
	//��������
	@RequestMapping("/addQuestion")
	@ResponseBody
	public List<Post> addQuestion(Post post,HttpServletRequest request){
		//���ݿ���������
		post.setLabel("java");
		postService.insQuestion(post);
		
		
		//������̳
				List<Post> posts = postService.selAllPost();
				for (Post p : posts) {
					List<String> comments = postService.selAllComment(p.getId());
					p.setComment(comments);
				}
				request.setAttribute("posts", posts);
				return posts;
		
	}
	
	
	
	
}
