package yh.admin.service;

import yh.admin.controller.AdminStaticsDto;

public interface AdminStaticsService {

	public AdminStaticsDto recipeCount(int recipeCount) throws Exception;
	
	public AdminStaticsDto userCount(int userCount) throws Exception;
	
	public AdminStaticsDto recipeSaleCount(int recipeSaleCount) throws Exception;
}
