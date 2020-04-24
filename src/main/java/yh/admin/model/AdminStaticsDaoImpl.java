package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;

// 홈페이지 통계
public class AdminStaticsDaoImpl extends SqlSessionDaoSupport implements AdminStaticsDao {

	public List<AdminRecipeDto> recipeCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.recipeCount", statics);
	} // 등록 레시피 수

	public List<AdminUserDto> userCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.userCount", statics);
	} // 회원 가입자 수

	public List<AdminSaleDto> recipeSaleCount(String statics) throws Exception {
		return getSqlSession().selectList("adminStatics.recipeSaleCount", statics);
	} // 판매 레시피 수


}
