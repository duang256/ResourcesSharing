package cn.wit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import cn.wit.pojo.*;
public interface ResourceMapper {
	@Select("select *from resource where type='Java'")
	public List<Resource> selJavaResource();
	@Select("select *from resource where type='Android'")
	public List<Resource> selAndroidResource();
	@Select("select *from resource where type='Database'")
	public List<Resource> selDatabaseResource();
	@Select("select *from resource where type='Algorithm'")
	public List<Resource> selAlgorithmResource();
}
