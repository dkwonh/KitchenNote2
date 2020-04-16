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
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;
import wh.admin.manage.model.TeacherApply;

public class AdminPageDao extends SqlSessionDaoSupport{
	
	public List<MemberDto> getUserList(FilterDto f){
		
		return getSqlSession().selectList("admin.getUserList", f);
	}
	
	public List<ChefDto> getChefList(FilterDto f){
		return getSqlSession().selectList("admin.getChefList",f);
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
	
	public int deleteUser(DropMembersDto drop) {
		getSqlSession().insert("admin.insertDrop",drop);
		return getSqlSession().delete("admin.deleteUser",drop.getMember_id());
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
		 getSqlSession().update("admin.upLevel",chef.getMember_id());
		 return getSqlSession().delete("admin.denyChefUp",chef.getMember_id());
	}
	
	public int upLevel(String member_id) {
		return getSqlSession().update("admin.upLevel",member_id);
	}
	
	public int denyChefUp(String member_id) {
		return getSqlSession().delete("admin.denyChefUp",member_id);
	}
	
	public int getDropCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getDropCount",f);
	}
	
	public List<DropMembersDto> getDropList(FilterDto f){
		return getSqlSession().selectList("admin.getDropList",f);
	}
	
	public List<AdminRecipeDto> getRecipeList(FilterDto f){
		return getSqlSession().selectList("admin.getRecipeList",f);
	}
	
	public int getRecipeCount(FilterDto f){
		return getSqlSession().selectOne("admin.getRecipeCount",f);
	}
	
	public int deleteRecipe(DelRecipeDto del) {
		getSqlSession().insert("admin.insertDelRecipe",del);
		return getSqlSession().delete("admin.deleteRecipe",del.getRecipe_id());
				
	}
	
	public List<AdminRecipeDto> getPayList(FilterDto f) {
		return getSqlSession().selectList("admin.getPayList",f);
	}
	
	public int getPayCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getPayCount",f);
	}
	
	public int getDelCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getDelCount",f);
	}
	
	public List<DelRecipeDto> getDelRecipeList(FilterDto f){
		return getSqlSession().selectList("admin.getDelRecipeList",f);
	}
	
	public int getPaymentCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getPaymentCount",f);
	}
	
	public List<PayListDto> getPaymentList(FilterDto f){
		return getSqlSession().selectList("admin.getPaymentList",f);
	}
	
	public int getPurRecipeCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getPurRecipeCount",f);
	}
	
	public List<PurchaseRecipeDto> getPurRecipeList(FilterDto f){
		return getSqlSession().selectList("admin.getPurRecipeList",f);
	}
	
	public List<CookingClassDto> getClassList(FilterDto f){
		return getSqlSession().selectList("admin.getClassList",f);
	}
	
	public int getClassCount(FilterDto f) {
		return getSqlSession().selectOne("admin.getClassCount",f);
	}
	
	public int getApplyCount(int c_num) {
		return getSqlSession().selectOne("admin.getApplyCount",c_num);
	}
	
	public List<TeacherApply> getApplyList(FilterDto f){
		return getSqlSession().selectList("admin.getApplyList",f);
	}
	
	/*
	 * public List<MemberDto> getUserFilter(FilterDto f) { return
	 * getSqlSession().selectList("admin.getUserFilter",f); }
	 * 
	 * public int getFilterCount(FilterDto f) { return
	 * getSqlSession().selectOne("admin.getFilterCount",f); }
	 */
}
