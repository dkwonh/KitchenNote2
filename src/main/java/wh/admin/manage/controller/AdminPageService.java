package wh.admin.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.dao.AdminPageDao;
import wh.admin.manage.model.AdminRecipeDto;
import wh.admin.manage.model.ChefApplyDto;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.CookingClassDto;
import wh.admin.manage.model.DelRecipeDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;
import wh.admin.manage.model.TeacherApply;
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
	
	public int getUserCount(FilterDto f) {
		return adminPageDao.getUserCount(f);
	}
	
	public int getChefCount(FilterDto f) {
		return adminPageDao.getChefCount(f);
	}
	
	public int updateUser(Map<String,String> map) {
		return adminPageDao.updateUser(map);
	}
	
	public int deleteUser(DropMembersDto drop) {
		return adminPageDao.deleteUser(drop);
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
	
	public int getDropCount(FilterDto f) {
		return adminPageDao.getDropCount(f);
	}
	
	public List<DropMembersDto> getDropList(FilterDto f){
		return adminPageDao.getDropList(f);
	}
	
	public List<AdminRecipeDto> getRecipeList(FilterDto f){
		return adminPageDao.getRecipeList(f);
	}
	
	public int getRecipeCount(FilterDto f) {
		return adminPageDao.getRecipeCount(f);
	}
	
	public int deleteRecipe(DelRecipeDto del) {
		return adminPageDao.deleteRecipe(del);
	}
	
	public List<AdminRecipeDto> getPayList(FilterDto f){
		return adminPageDao.getPayList(f);
	}
	
	public int getPayCount(FilterDto f) {
		return adminPageDao.getPayCount(f);
	}
	
	public int getDelCount(FilterDto f) {
		return adminPageDao.getDelCount(f);
	}
	
	public List<DelRecipeDto> getDelRecipeList(FilterDto f){
		return adminPageDao.getDelRecipeList(f);
	}
	
	public int getPaymentCount(FilterDto f) {
		return adminPageDao.getPaymentCount(f);
	}
	
	public List<PayListDto> getPaymentList(FilterDto f){
		return adminPageDao.getPaymentList(f);
	}
	
	public List<PurchaseRecipeDto> getPurRecipeList(FilterDto f){
		return adminPageDao.getPurRecipeList(f);
	}
	
	public int getPurRecipeCount(FilterDto f) {
		return adminPageDao.getPurRecipeCount(f);
	}
	
	public List<CookingClassDto> getClassList(FilterDto f){
		return adminPageDao.getClassList(f);
	}
	
	public int getClassCount(FilterDto f) {
		return adminPageDao.getClassCount(f);
	}
	
	public int getApplyCount(int c_num) {
		return adminPageDao.getApplyCount(c_num);
	}
	
	public List<TeacherApply> getApplyList(FilterDto f){
		return adminPageDao.getApplyList(f);
	}
	
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * adminPageDao.getUserFilter(f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * adminPageDao.getFilterCount(f); }
	 */
	
}
