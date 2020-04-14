package wh.admin.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.dao.AdminPageDao;
import wh.admin.manage.model.ChefApplyDto;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;
@Service
public class AdminPageService {
	
	@Autowired
	AdminPageDao adminPageDao;
	
	public List<MemberDto> getUserList(FilterDto f){
		return adminPageDao.getUserList(f);
	}
	
	public List<ChefDto> getChefList(FilterDto f){
		return adminPageDao.getChefList(f);
	}
	
	public List<DropMembersDto> getDropList(){
		return adminPageDao.getDropList();
	}
	
	public int getUserCount(FilterDto f) {
		return adminPageDao.getUserCount(f);
	}
	
	public int getChefCount(FilterDto f) {
		return adminPageDao.getChefCount(f);
	}
	
	public int updateUser(Map<String,String> map) {
		return adminPageDao.updateUser(map);
	}
	
	public int deleteUser(String member_id) {
		return adminPageDao.deleteUser(member_id);
	}
	
	public int updateChef(Map<String,String> map) {
		return adminPageDao.updateChef(map);
	}
	
	public int deleteChef(String member_id) {
		return adminPageDao.deleteChef(member_id);
	}
	
	public int getChefApplyCount() {
		return adminPageDao.getChefApplyCount();
	}
	
	public List<ChefApplyDto> getChefApply(int start){
		return adminPageDao.getChefApply(start);
	}
	
	public int allowChefUp(ChefApplyDto chef) {
		return adminPageDao.allowChefUp(chef);
	}
	
	public int denyChefup(String member_id) {
		return adminPageDao.denyChefUp(member_id);
	}
	
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * adminPageDao.getUserFilter(f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * adminPageDao.getFilterCount(f); }
	 */
	
}
