package yh.admin.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminStaticsDto;

public class AdminStaticsDaoImpl extends SqlSessionDaoSupport implements AdminStaticsDao {

	public AdminStaticsDto recipeCount(int recipeCount) throws Exception{
		return getSqlSession().selectOne("adminStatics.recipeCount", recipeCount);
	}
	
	public AdminStaticsDto userCount(int userCount) throws Exception{
		return getSqlSession().selectOne("adminStatics.userCount",userCount);
	}
	
	public AdminStaticsDto recipeSaleCount(int recipeSaleCount) throws Exception{
		return getSqlSession().selectOne("adminStatics.recipeSaleCount",recipeSaleCount);
	}
	
}
