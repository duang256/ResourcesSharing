package cn.wit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wit.mapper.ResourceMapper;
import cn.wit.mapper.UserMapper;
import cn.wit.pojo.Resource;
import cn.wit.pojo.User;
import cn.wit.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	public User checkUserLoginService(User user) {
		return userMapper.login(user);
	}
	
	@Override
	public void updateUserPasswordService(int id,String newPassword) {
		userMapper.updatePassword(id,newPassword);
	}

	@Override
	public void updateUserInfo(User user) {
		userMapper.updateUserInfo(user);
	}

	@Override
	public void register(User user) {
		userMapper.insUser(user);
	}
	
	
}
