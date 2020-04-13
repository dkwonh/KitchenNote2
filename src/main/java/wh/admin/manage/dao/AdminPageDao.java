package wh.admin.manage.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.MemberDto;

public class AdminPageDao extends SqlSessionDaoSupport{
	
	public List<MemberDto> getUserList(int start){
		
		return getSqlSession().selectList("admin.getUserList", start);
	}
	
	public List<ChefDto> getChefList(){
		return getSqlSession().selectList("admin.getChefList");
	}
	
	public List<DropMembersDto> getDropList(){
		return getSqlSession().selectList("admin.getDropList");
	}
	
	public int getCount() {
		return getSqlSession().selectOne("admin.getCount");
	}
}
