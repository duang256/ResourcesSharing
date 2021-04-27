package cn.wit.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
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
	//删除帖子
	@Delete("delete from post where id=#{id}")
	public void delPost(int id);
	//删除指定帖子所有评论
	@Delete("delete from comment where pid=#{id}")
	public void delAllCommentByPid(int id);
	//删除一条评论
	@Delete("delete from comment where comment=#{comment}")
	public void delCommentById(String comment);
	
	
}
