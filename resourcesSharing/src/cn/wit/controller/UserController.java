package cn.wit.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wit.mapper.UserMapper;
import cn.wit.pojo.Post;
import cn.wit.pojo.Resource;
import cn.wit.pojo.User;
import cn.wit.service.PostService;
import cn.wit.service.ResourceService;
import cn.wit.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private PostService postService;
	
	
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request){
		try{
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			User u = userService.checkUserLoginService(user);
			if(u!=null){
				request.getSession().setAttribute("user", u);
				
				List<Resource> javaResource = resourceService.getJavaResource();
				List<Resource> androidResource = resourceService.getAndroidResource();
				List<Resource> databaseResource = resourceService.getDatabaseResource();
				List<Resource> algorithmResource = resourceService.getAlgorithmResource();
				request.setAttribute("javaResource", javaResource);
				request.setAttribute("androidResource", androidResource);
				request.setAttribute("databaseResource", databaseResource);
				request.setAttribute("algorithmResource", algorithmResource);
				
				List<Post> posts = postService.selAllPost();
				for (Post post : posts) {
					List<String> comment = postService.selAllComment(post.getId());
					post.setComment(comment);
				}
				request.setAttribute("posts", posts);
				
				return "main";
			}else{
				return "error";
			}
		}catch(Exception e){
			return "error";
		}
		
	}
	
	@RequestMapping("/userHome")
	public String home(){
		return "home";
	}
	
	@RequestMapping("/updatepassword")
	public String updPassword(HttpServletRequest request,String oldPassword,String newPassword){
		try{
			
			System.out.println(oldPassword);
			System.out.println(newPassword);
			User user = (User) request.getSession().getAttribute("user");
			if(user.getPassword().equals(oldPassword)){
				System.out.println("验证成功");
				System.out.println("update user set password="+newPassword+" where id="+user.getId());
				userService.updateUserPasswordService(user.getId(), newPassword);
			}else{
				System.out.println("验证失败");
			}
			return "redirect:/home.jsp";
		}catch(Exception e){
			return "error";
		}
		
	}
	
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user,HttpServletRequest request){
		User u=(User) request.getSession().getAttribute("user");
		user.setId(u.getId());
		try{
			userService.updateUserInfo(user);
			return "redirect:/home.jsp";
		}catch(Exception e){
			return "error";
		}
	}
	
	@RequestMapping("/register")
	public String register(User user){
		try{
			//获取当前注册时间
			Date date = new Date();
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			String registerTime = df.format(date);
			System.out.println(registerTime);
			user.setRegisterTime(registerTime);
			
			userService.register(user);
			return "redirect:/login.jsp";
		}catch(Exception e){
			return "error";
		}
	}
	
	
	
	
	
	
	
	
	
}
