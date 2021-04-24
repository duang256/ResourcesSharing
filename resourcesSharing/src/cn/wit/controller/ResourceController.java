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
		//������Ӧͷĳ�����Ե�ֵ�Ϳ�����serHeader��������֮ǰ��content-TypeҲ������setHeader����
				//������Ӧͷ�е�filename���Բ�����ʵ���ļ���һ��������������ļ���fileName���������ִ��ڵ��ļ�
				resp.setHeader("content-Disposition", "attachment;filename="+fileName);
				//�õ�Ŀ���ļ�,getRealPath��һ���������ļ��д���Ŀ��Ŀ¼��ʼ�����·�����ڶ����������ļ����������ļ��Ӵ��̸�Ŀ¼��ʼ��ȫ·��
				File file = new File(req.getServletContext().getRealPath("resources/fileResources"),fileName);
				ServletOutputStream os=null;
				try {
					//commens-io �� Commons-fileupload ����jar����ʹ�ù����ཫ�ļ�ת�����������
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
	public List<Resource> demo(MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{ //�������������ͱ���nameһ��
		//��ȡ�ļ��� �е�������ļ�������·�����е�������ļ�����ȫ·����
		String fileName = file.getOriginalFilename();
		System.out.println("filename:"+fileName);
		//����ȡ�ļ������֣�ֻ��ȡ�ļ��ĺ�׺  subString��jdk String���з��� ��ͷ����β
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
