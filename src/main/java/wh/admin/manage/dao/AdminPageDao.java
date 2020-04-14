package wh.admin.manage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.ChefApplyDto;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;

public class AdminPageDao extends SqlSessionDaoSupport{
	
	public List<MemberDto> getUserList(FilterDto f){
		
		return getSqlSession().selectList("admin.getUserList", f);
	}
	
	public List<ChefDto> getChefList(FilterDto f){
		return getSqlSession().selectList("admin.getChefList",f);
	}
	
	public List<DropMembersDto> getDropList(){
		return getSqlSession().selectList("admin.getDropList");
	}
	
	public int getUserCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getUserCount",f);
	}
	
	public int getChefCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getChefCount",f);
	}
	
	public int updateUser(Map<String,String> map) {
		return getSqlSession().update("admin.updateUser",map);
	}
	
	public int deleteUser(String member_id) {
		return getSqlSession().delete("admin.deleteUser",member_id);
	}
	
	public int deleteChef(String member_id) {
		return getSqlSession().delete("admin.deleteChef",member_id);
	}
	
	public int updateChef(Map<String,String> map) {
		getSqlSession().update("admin.updateUser",map);
		return getSqlSession().update("admin.updateChef",map);
	}
	
	public int getChefApplyCount() {
		return getSqlSession().selectOne("admin.getChefApplyCount");
	}
	
	public List<ChefApplyDto> getChefApply(int start){
		return getSqlSession().selectList("admin.getChefApply",start);
	}
	
	public int allowChefUp(ChefApplyDto chef) {
		
		 getSqlSession().insert("admin.allowChefUp",chef);
		 return getSqlSession().delete("admin.denyChefUp",chef.getMember_id());
	}
	
	public int denyChefUp(String member_id) {
		return getSqlSession().delete("admin.denyChefUp",member_id);
	}
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * getSqlSession().selectList("admin.getUserFilter",f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * getSqlSession().selectOne("admin.getFilterCount",f); }
	 */
}
