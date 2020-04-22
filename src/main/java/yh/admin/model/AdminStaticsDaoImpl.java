package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;

public class AdminStaticsDaoImpl extends SqlSessionDaoSupport implements AdminStaticsDao {

	public List<AdminRecipeDto> recipeCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.recipeCount", statics);
	}

	public List<AdminUserDto> userCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.userCount", statics);
	}

	public List<AdminSaleDto> recipeSaleCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.recipeSaleCount", statics);
	}


}
