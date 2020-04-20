package yh.admin.model;

import yh.admin.controller.AdminStaticsDto;

public interface AdminStaticsDao {

	public AdminStaticsDto recipeCount(int recipeCount) throws Exception;
	
	public AdminStaticsDto userCount(int userCount) throws Exception;
	
	public AdminStaticsDto recipeSaleCount(int recipeSaleCount) throws Exception;
	
}
