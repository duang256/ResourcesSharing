package cn.wit.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.wit.pojo.*;
public interface PostMapper {
	//��ѯ��������
	@Select("select *from post")
	public List<Post> selAllPost();
	//��ѯ��������
	@Select("select comment from comment where pid=#{id}")
	public List<String>selAllComment(int id);
	//����������
	@Select("insert into comment values(default,#{0},#{1})")
	public void insComment(int pid,String comment);
	//��������
	@Insert("insert into post values(default,#{label},#{question})")
	public void insPost(Post post);
}
