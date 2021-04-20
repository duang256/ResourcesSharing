package cn.wit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.wit.pojo.User;


public interface UserMapper {
	//��¼��֤
	@Select("select *from user where username=#{username} and password=#{password}")
	User login(User user);
	//�޸�����
	@Update("update user set password=#{1} where id=#{0}")
	void updatePassword(int id,String newPassword);
	//ע��
	@Insert("insert into user values(default,#{username},#{password},#{registerTime},'',1,'',0)")
	void insUser(User user);
	//�����û���Ϣ
	@Update("update user set username="
			+ "#{username},registerTime=#{registerTime},centainFields=#{centainFields},sex=#{sex},birthday=#{birthday} "
			+ "where id=#{id}")
	void updateUserInfo(User user);
	
}
