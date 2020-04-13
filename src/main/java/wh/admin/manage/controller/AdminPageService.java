package wh.admin.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.dao.AdminPageDao;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.MemberDto;
@Service
public class AdminPageService {
	
	@Autowired
	AdminPageDao adminPageDao;
	
	public List<MemberDto> getUserList(int start){
		return adminPageDao.getUserList(start);
	}
	
	public List<ChefDto> getChefList(){
		return adminPageDao.getChefList();
	}
	
	public List<DropMembersDto> getDropList(){
		return adminPageDao.getDropList();
	}
	
	public int getCount() {
		return adminPageDao.getCount();
	}
	
}
