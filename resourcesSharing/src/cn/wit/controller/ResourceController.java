package cn.wit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.wit.pojo.Post;
import cn.wit.pojo.Resource;
import cn.wit.pojo.User;
import cn.wit.service.PostService;
import cn.wit.service.ResourceService;

@Controller
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private PostService postService;
	
	@RequestMapping("/staticResource")
	public String staticResource(String name,HttpServletRequest request){
		String html=resourceService.getHtml(name);
		request.setAttribute("html", html);
		return "article";
	}
	
	
	@RequestMapping("/download")
	public void download(@RequestParam("file")String fileName,HttpServletResponse resp,HttpServletRequest req) throws ServletException, IOException{
		//设置响应头某个属性的值就可以用serHeader、，包括之前的content-Type也可以用setHeader设置
				//设置响应头中的filename可以不和真实的文件名一样，但是请求的文件名fileName必须是名字存在的文件
				resp.setHeader("content-Disposition", "attachment;filename="+fileName);
				//拿到目标文件,getRealPath第一个参数是文件夹从项目根目录开始的相对路径，第二个参数是文件名，返回文件从磁盘根目录开始的全路径
				File file = new File(req.getServletContext().getRealPath("resources/fileResources"),fileName);
				ServletOutputStream os=null;
				try {
					//commens-io 和 Commons-fileupload 两个jar包，使用工具类将文件转弯二进制数组
					byte[] bytes = FileUtils.readFileToByteArray(file);
					os = resp. getOutputStream();
					os.write(bytes);
					os.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					try {
						if(os!=null){
							os.close();
						}
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				req.getRequestDispatcher("/login").forward(req, resp);
	}
	
	
	@RequestMapping("/upload")
	@ResponseBody
	public List<Resource> upload(MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{ //这里参数名必须和表单中name一致
		//获取文件名 有的浏览器文件名不带路径，有的浏览器文件名是全路径的
		String fileName = file.getOriginalFilename();
		System.out.println("filename:"+fileName);
		//不获取文件的名字，只获取文件的后缀  subString是jdk String类中方法 包头不包尾
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		String name=fileName.substring(0,fileName.lastIndexOf("."));
		String path=req.getServletContext().getRealPath("resources/fileResources")+"\\"+name+suffix;
		System.out.println("path:"+path);
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File("D:/eclipseWorkspace/resourcesSharing/WebContent/resources/fileResources"+"\\"+name+suffix));
		resourceService.addDynamicResource(fileName);
		
		List<Resource> allDynamicResource = resourceService.getAllDynamicResource();
		return allDynamicResource;
		
	}
	
	@RequestMapping("/delStaticFile")
	@ResponseBody
	public List<Resource> delStaticFile(String name,String type,HttpServletRequest request){
		//从数据库中删除
		resourceService.delStaticFileName(name);
		//从资源文件中删除,暂时不做这个操作
		
		//返回更新的resource
		switch (type) {
			case "Java":{
				List<Resource> javaResource = resourceService.getJavaResource();
				//改request
				request.setAttribute("javaResource", javaResource);
				return javaResource;
			}
			case "Android":{
				List<Resource> androidResource = resourceService.getAndroidResource();
				//改request
				request.setAttribute("androidResource", androidResource);
				return androidResource;
			}
			case "Database":{
				List<Resource> databaseResource = resourceService.getDatabaseResource();
				//改request
				request.setAttribute("databaseResource", databaseResource);
				return databaseResource;
			}
			case "Algorithm":{
				List<Resource> algorithmResource = resourceService.getAlgorithmResource();
				//改request
				request.setAttribute("algorithmResource", algorithmResource);
				return algorithmResource;
			}
			default:
				return null;
		}
	}
	
	
	@RequestMapping("/writeArticle")
	public String writeArticle(Resource resource,HttpServletRequest request){
		//将它存入数据库
		resourceService.addStaticResource(resource);
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
	}
	
	
	
}
