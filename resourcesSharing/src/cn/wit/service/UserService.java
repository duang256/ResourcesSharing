package cn.wit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.wit.pojo.*;


public interface UserService {
	User checkUserLoginService(User user);
	void updateUserPasswordService(int id,String newPassword);
	void updateUserInfo(User user);
	void register(User user);
}
