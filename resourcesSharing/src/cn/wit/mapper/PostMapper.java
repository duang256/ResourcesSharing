package cn.wit.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.wit.pojo.*;
public interface PostMapper {
	//查询所有问题
	@Select("select *from post")
	public List<Post> selAllPost();
	//查询所有评论
	@Select("select comment from comment where pid=#{id}")
	public List<String>selAllComment(int id);
	//新增呢评论
	@Select("insert into comment values(default,#{0},#{1})")
	public void insComment(int pid,String comment);
	//新增问题
	@Insert("insert into post values(default,#{label},#{question})")
	public void insPost(Post post);
}
