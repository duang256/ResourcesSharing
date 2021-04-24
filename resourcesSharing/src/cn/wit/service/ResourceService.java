package cn.wit.service;

import java.util.List;

import cn.wit.pojo.Resource;

public interface ResourceService {
	List<Resource> getJavaResource();
	List<Resource> getAndroidResource();
	List<Resource> getDatabaseResource();
	List<Resource> getAlgorithmResource();
	
	List<Resource> getAllDynamicResource();
	void addDynamicResource(String name);
}
