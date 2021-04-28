package cn.wit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import cn.wit.pojo.*;
public interface ResourceMapper {
	//��̬��Դ
	@Select("select *from resource where type='Java'")
	public List<Resource> selJavaResource();
	@Select("select *from resource where type='Android'")
	public List<Resource> selAndroidResource();
	@Select("select *from resource where type='Database'")
	public List<Resource> selDatabaseResource();
	@Select("select *from resource where type='Algorithm'")
	public List<Resource> selAlgorithmResource();
	
	//��̬��Դ
	@Select("select *from resource where root=0")
	public List<Resource> selAllDynamicReosource();
	//�ϴ���Դ
	@Insert("insert into resource values(default,#{0},'dynamic',0,'')")
	public void insDynamicReosource(String name);
	
	//ɾ��һƪ����
	@Delete("delete from resource where name=#{name}")
	public void delStaticFileName(String name);
	
	//���Ӿ�̬����
	@Insert("insert into resource values(default,#{name},#{type},1,#{html})")
	public void insStaticResource(Resource resource);
	//��ѯһƪ���µ�html
	@Select("select html from resource where name=#{0}")
	public String selhtml(String name);
	
}
