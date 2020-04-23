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
		return getSqlSession().selectList("manage.userExcel");
	}
	
	public List<ChefDto> chefExcel(){
		return getSqlSession().selectList("manage.chefExcel");
	}
	
	public List<DropMembersDto> dropExcel(){
		return getSqlSession().selectList("manage.dropExcel");
	}
	
	public List<PayListDto> forkExcel(){
		return getSqlSession().selectList("manage.forkExcel");
	}
	
	public List<PurchaseRecipeDto> recipeExcel(){
		return getSqlSession().selectList("manage.recipeExcel");
	}
}
