package wh.admin.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.dao.AdminPageDao;
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
	
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * adminPageDao.getUserFilter(f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * adminPageDao.getFilterCount(f); }
	 */
	
}
