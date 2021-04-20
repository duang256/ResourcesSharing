package cn.wit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourceController {
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
	@RequestMapping("/leetcode")
	public String algorithmInstall(){
		return "resources/articleResources/leetcode";
	}
}
