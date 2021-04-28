package cn.wit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import cn.wit.pojo.*;
public interface ResourceMapper {
	//静态资源
	@Select("select *from resource where type='Java'")
	public List<Resource> selJavaResource();
	@Select("select *from resource where type='Android'")
	public List<Resource> selAndroidResource();
	@Select("select *from resource where type='Database'")
	public List<Resource> selDatabaseResource();
	@Select("select *from resource where type='Algorithm'")
	public List<Resource> selAlgorithmResource();
	
	//动态资源
	@Select("select *from resource where root=0")
	public List<Resource> selAllDynamicReosource();
	//上传资源
	@Insert("insert into resource values(default,#{0},'dynamic',0,'')")
	public void insDynamicReosource(String name);
	
	//删除一篇文章
	@Delete("delete from resource where name=#{name}")
	public void delStaticFileName(String name);
	
	//增加静态文章
	@Insert("insert into resource values(default,#{name},#{type},1,#{html})")
	public void insStaticResource(Resource resource);
	//查询一篇文章的html
	@Select("select html from resource where name=#{0}")
	public String selhtml(String name);
	
}
