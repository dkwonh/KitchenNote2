package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;

public class AdminStaticsDaoImpl extends SqlSessionDaoSupport implements AdminStaticsDao {

	public List<AdminRecipeDto> recipeCount() throws Exception {
		return getSqlSession().selectList("adminStatics.recipeCount");
	}

	public List<AdminUserDto> userCount() throws Exception {
		return getSqlSession().selectList("adminStatics.userCount");
	}

	public List<AdminSaleDto> recipeSaleCount() throws Exception {
		return getSqlSession().selectList("adminStatics.recipeSaleCount");
	}

}
