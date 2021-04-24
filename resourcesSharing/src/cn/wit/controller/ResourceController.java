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

import cn.wit.pojo.Resource;
import cn.wit.service.ResourceService;

@Controller
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
	
	
	@RequestMapping("/jdkInstall")
	public String jdkInstall(){
		return "resources/articleResources/jdkInstall";
	}
	
	@RequestMapping("/androidInstall")
	public String androidInstall(){
		return "resources/articleResources/androidInstall";
	}
	@RequestMapping("/mysqlAction")
	public String mysql(){
		return "resources/articleResources/mysqlAction";
	}
	@RequestMapping("/leetcode135")
	public String algorithmInstall(){
		return "resources/articleResources/leetcode135";
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
	public List<Resource> demo(MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{ //这里参数名必须和表单中name一致
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
}
