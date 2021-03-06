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
		/*if(request.getSession().getAttribute("user")!=null){
			request.getSession().removeAttribute("user");
			return "redirect:/login.jsp";
		}*/
		
		try{
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			User u = userService.checkUserLoginService(user);
			if(u!=null){
				
				if(u.getRoot()==0){
					//用户信息
					request.getSession().setAttribute("user", u);
					
					//所有静态资源
					List<Resource> javaResource = resourceService.getJavaResource();
					List<Resource> androidResource = resourceService.getAndroidResource();
					List<Resource> databaseResource = resourceService.getDatabaseResource();
					List<Resource> algorithmResource = resourceService.getAlgorithmResource();
					request.setAttribute("javaResource", javaResource);
					request.setAttribute("androidResource", androidResource);
					request.setAttribute("databaseResource", databaseResource);
					request.setAttribute("algorithmResource", algorithmResource);
					
					//加载所有帖子
					List<Post> posts = postService.selAllPost();
					for (Post post : posts) {
						List<String> comment = postService.selAllComment(post.getId());
						post.setComment(comment);
					}
					request.setAttribute("posts", posts);
					
					//静态资源
					List<Resource> dynamicResource=resourceService.getAllDynamicResource();
					request.setAttribute("dynamicResource", dynamicResource);
					
					return "main";
				}
				if(u.getRoot()==1){
					//用户信息
					request.getSession().setAttribute("user", u);
					//所有静态资源
					List<Resource> javaResource = resourceService.getJavaResource();
					List<Resource> androidResource = resourceService.getAndroidResource();
					List<Resource> databaseResource = resourceService.getDatabaseResource();
					List<Resource> algorithmResource = resourceService.getAlgorithmResource();
					request.setAttribute("javaResource", javaResource);
					request.setAttribute("androidResource", androidResource);
					request.setAttribute("databaseResource", databaseResource);
					request.setAttribute("algorithmResource", algorithmResource);
					
					//加载所有帖子
					List<Post> posts = postService.selAllPost();
					for (Post post : posts) {
						List<String> comment = postService.selAllComment(post.getId());
						post.setComment(comment);
					}
					request.setAttribute("posts", posts);
					
					//静态资源
					List<Resource> dynamicResource=resourceService.getAllDynamicResource();
					request.setAttribute("dynamicResource", dynamicResource);
					return "administrator";
				}else{
					return "error";
				}
				
			}else{
				return "redirect:/login.jsp?error=yes";
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
			
			System.out.println("原密码"+oldPassword);
			System.out.println("新密码"+newPassword);
			User user = (User) request.getSession().getAttribute("user");
			System.out.println("密码："+user.getPassword());
			if(user.getPassword().equals(oldPassword)){
				System.out.println("验证成功");
				System.out.println("update user set password="+newPassword+" where id="+user.getId());
				userService.updateUserPasswordService(user.getId(), newPassword);
			}else{
				System.out.println("验证失败");
			}
			return "redirect:/login.jsp";
		}catch(Exception e){
			return "error";
		}
		
	}
	
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user,HttpServletRequest request){
		User u=(User) request.getSession().getAttribute("user");
		user.setId(u.getId());
		user.setRoot(0);
		user.setPassword(u.getPassword());
		request.getSession().setAttribute("user", user);
		
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
