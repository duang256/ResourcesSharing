package cn.wit.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.wit.pojo.*;
public interface PostMapper {
	@Select("select *from post")
	public List<Post> selAllPost();
	@Select("select comment from comment where pid=#{id}")
	public List<String>selAllComment(int id);
	@Select("insert into comment values(default,#{0},#{1})")
	public void insComment(int pid,String comment);
}
