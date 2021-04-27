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
		//插入评论
		postService.insComment(pid,comment);
		
		//更新论坛
		List<Post> posts = postService.selAllPost();
		for (Post post : posts) {
			List<String> comments = postService.selAllComment(post.getId());
			post.setComment(comments);
		}
		request.setAttribute("posts", posts);
		return posts;
	}
	
	//新增问题
	@RequestMapping("/addQuestion")
	@ResponseBody
	public List<Post> addQuestion(Post post,HttpServletRequest request){
		//数据库新增问题
		post.setLabel("java");
		postService.insQuestion(post);
		
		
		//更新论坛
				List<Post> posts = postService.selAllPost();
				for (Post p : posts) {
					List<String> comments = postService.selAllComment(p.getId());
					p.setComment(comments);
				}
				request.setAttribute("posts", posts);
				return posts;
		
	}
	
	
	/**
	 * 管理员删除帖子
	 * 	同时删除帖子和它的所有评论
	 */
	@RequestMapping("/delPost")
	@ResponseBody
	public List<Post> delPost(int id,HttpServletRequest request){
		postService.delPost(id);
		
		//更新论坛
		List<Post> posts = postService.selAllPost();
		for (Post p : posts) {
			List<String> comments = postService.selAllComment(p.getId());
			p.setComment(comments);
		}
		request.setAttribute("posts", posts);
		return posts;
	}
	
	/**
	 * 管理员删除评论
	 * 	找到该评论对应的帖子，并找出其id
	 */
	@RequestMapping("/delComment")
	@ResponseBody
	public List<Post> delComment(String comment,HttpServletRequest request){
		
		postService.delOneComment(comment);
		
		//更新论坛
		List<Post> posts = postService.selAllPost();
		for (Post p : posts) {
			List<String> comments = postService.selAllComment(p.getId());
			p.setComment(comments);
		}
		request.setAttribute("posts", posts);
		return posts;
	}
	
	
}
