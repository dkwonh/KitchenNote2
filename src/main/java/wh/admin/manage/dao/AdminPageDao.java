package wh.admin.manage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.AdminRecipeDto;
import wh.admin.manage.model.ChefApplyDto;
import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.CookingClassDto;
import wh.admin.manage.model.DelRecipeDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.NotifyDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;
import wh.admin.manage.model.TeacherApply;

public class AdminPageDao extends SqlSessionDaoSupport{
	
	public List<MemberDto> getUserList(FilterDto f){
		
		return getSqlSession().selectList("manage.getUserList", f);
	}
	
	public List<ChefDto> getChefList(FilterDto f){
		return getSqlSession().selectList("manage.getChefList",f);
	}
	
	public int getUserCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getUserCount",f);
	}
	
	public int getChefCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getChefCount",f);
	}
	
	public int updateUser(Map<String,String> map) {
		return getSqlSession().update("manage.updateUser",map);
	}
	
	public int deleteUser(DropMembersDto drop) {
		getSqlSession().insert("manage.insertDrop",drop);
		return getSqlSession().delete("manage.deleteUser",drop.getMember_id());
	}
	
	public int deleteChef(String member_id) {
		return getSqlSession().delete("manage.deleteChef",member_id);
	}
	
	public int updateChef(Map<String,String> map) {
		getSqlSession().update("manage.updateUser",map);
		return getSqlSession().update("manage.updateChef",map);
	}
	
	public int getChefApplyCount() {
		return getSqlSession().selectOne("manage.getChefApplyCount");
	}
	
	public List<ChefApplyDto> getChefApply(int start){
		return getSqlSession().selectList("manage.getChefApply",start);
	}
	
	public int allowChefUp(ChefApplyDto chef) {
		 getSqlSession().insert("manage.allowChefUp",chef);
		 getSqlSession().update("manage.upLevel",chef.getMember_id());
		 return getSqlSession().delete("manage.denyChefUp",chef.getMember_id());
	}
	
	public int upLevel(String member_id) {
		return getSqlSession().update("manage.upLevel",member_id);
	}
	
	public int denyChefUp(String member_id) {
		return getSqlSession().delete("manage.denyChefUp",member_id);
	}
	
	public int getDropCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getDropCount",f);
	}
	
	public List<DropMembersDto> getDropList(FilterDto f){
		return getSqlSession().selectList("manage.getDropList",f);
	}
	
	public List<AdminRecipeDto> getRecipeList(FilterDto f){
		return getSqlSession().selectList("manage.getRecipeList",f);
	}
	
	public int getRecipeCount(FilterDto f){
		return getSqlSession().selectOne("manage.getRecipeCount",f);
	}
	
	public int deleteRecipe(DelRecipeDto del) {
		getSqlSession().insert("manage.insertDelRecipe",del);
		return getSqlSession().delete("manage.deleteRecipe",del.getRecipe_id());
				
	}
	
	public List<AdminRecipeDto> getPayList(FilterDto f) {
		return getSqlSession().selectList("manage.getPayList",f);
	}
	
	public int getPayCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getPayCount",f);
	}
	
	public int getDelCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getDelCount",f);
	}
	
	public List<DelRecipeDto> getDelRecipeList(FilterDto f){
		return getSqlSession().selectList("manage.getDelRecipeList",f);
	}
	
	public int getPaymentCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getPaymentCount",f);
	}
	
	public List<PayListDto> getPaymentList(FilterDto f){
		return getSqlSession().selectList("manage.getPaymentList",f);
	}
	
	public int getPurRecipeCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getPurRecipeCount",f);
	}
	
	public List<PurchaseRecipeDto> getPurRecipeList(FilterDto f){
		return getSqlSession().selectList("manage.getPurRecipeList",f);
	}
	
	public List<CookingClassDto> getClassList(FilterDto f){
		
		return getSqlSession().selectList("manage.getClassList",f);
	}
	
	public int getClassCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getClassCount",f);
	}
	
	public int getApplyCount(int c_num) {
		return getSqlSession().selectOne("manage.getApplyCount",c_num);
	}
	
	public List<TeacherApply> getApplyList(FilterDto f){
		return getSqlSession().selectList("manage.getApplyList",f);
	}
	
	public List<NotifyDto> getNotifyList(FilterDto f){
		return getSqlSession().selectList("manage.getNotifyList",f);
	}
	
	public int getNotifyCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getNotifyCount",f);
	}
	
	public int insertNotify(NotifyDto not) {
		return getSqlSession().insert("manage.insertNotify",not);
	}
	
	public int updateNotify(NotifyDto not) {
		return getSqlSession().update("manage.updateNotify",not);
	}
	
	public int deleteNotify(int num) {
		return getSqlSession().delete("manage.deleteNotify",num);
	}
	
	public NotifyDto getNotify(int num) {
		return getSqlSession().selectOne("manage.getNotify",num);
	}
	
	/*
	 * public int regClass(Map<String,String> map) { return
	 * getSqlSession().insert("manage.regClass",map); }
	 * 
	 * public int getClassPersonCount(Map<String,Integer> map) { return
	 * getSqlSession().selectOne("manage.getClassPersonCount",map); }
	 * 
	 * public CookingClassDto getClass(int c_num) { return
	 * getSqlSession().selectOne("manage.getClass",c_num); }
	 * 
	 * public int updateClass(Map<String,String> map) { return
	 * getSqlSession().update("manage.updateClass",map); }
	 * 
	 * 
	 * 
	 * public List<CookingClassDto> getRecruitList(FilterDto f){
	 * 
	 * return getSqlSession().selectList("manage.getRecruitList",f); }
	 * 
	 * public int getRecruitCount(FilterDto f) { return
	 * getSqlSession().selectOne("manage.getRecruitCount",f); }
	 * 
	 * 
	 * public int regRecruit(Map<String,String> map) { return
	 * getSqlSession().insert("manage.regRecruit",map); }
	 * 
	 * public int getRecruitPersonCount(Map<String,Integer> map) { return
	 * getSqlSession().selectOne("manage.getRecruitPersonCount",map); }
	 * 
	 * public CookingClassDto getRecruit(int c_num) { return
	 * getSqlSession().selectOne("manage.getRecruit",c_num); }
	 * 
	 * public int updateRecruit(Map<String,String> map) { return
	 * getSqlSession().update("manage.updateRecruit",map); }
	 */
	
	
	
	
	
	
	
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * getSqlSession().selectList("manage.getUserFilter",f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * getSqlSession().selectOne("manage.getFilterCount",f); }
	 */
}
