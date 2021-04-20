package cn.wit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wit.mapper.ResourceMapper;
import cn.wit.pojo.Resource;
import cn.wit.service.ResourceService;

@Service
public class ResourceServiceImpl implements ResourceService{

	@Autowired
	private ResourceMapper resourceMapper;
	@Override
	public List<Resource> getJavaResource() {
		return resourceMapper.selJavaResource();
	}
	@Override
	public List<Resource> getAndroidResource() {
		return resourceMapper.selAndroidResource();
	}
	@Override
	public List<Resource> getDatabaseResource() {
		return resourceMapper.selDatabaseResource();
	}
	@Override
	public List<Resource> getAlgorithmResource() {
		return resourceMapper.selAlgorithmResource();
	}

}