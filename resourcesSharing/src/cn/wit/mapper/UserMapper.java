package cn.wit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.wit.pojo.User;


public interface UserMapper {
	//登录验证
	@Select("select *from user where username=#{username} and password=#{password}")
	User login(User user);
	//修改密码
	@Update("update user set password=#{1} where id=#{0}")
	void updatePassword(int id,String newPassword);
	//注册
	@Insert("insert into user values(default,#{username},#{password},#{registerTime},'',1,'',0)")
	void insUser(User user);
	//更改用户信息
	@Update("update user set username="
			+ "#{username},registerTime=#{registerTime},centainFields=#{centainFields},sex=#{sex},birthday=#{birthday} "
			+ "where id=#{id}")
	void updateUserInfo(User user);
	
}
