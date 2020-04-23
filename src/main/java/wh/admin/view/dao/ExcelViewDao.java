package wh.admin.view.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;

public class ExcelViewDao extends SqlSessionDaoSupport{

	public List<MemberDto> userExcel(){
		return getSqlSession().selectList("admin.userExcel");
	}
	
	public List<ChefDto> chefExcel(){
		return getSqlSession().selectList("admin.chefExcel");
	}
	
	public List<DropMembersDto> dropExcel(){
		return getSqlSession().selectList("admin.dropExcel");
	}
	
	public List<PayListDto> forkExcel(){
		return getSqlSession().selectList("admin.forkExcel");
	}
	
	public List<PurchaseRecipeDto> recipeExcel(){
		return getSqlSession().selectList("admin.recipeExcel");
	}
}
