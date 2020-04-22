package yh.admin.service;

import java.util.List;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;

public interface AdminStaticsService {

	public List<AdminRecipeDto> recipeCount(String statics) throws Exception;

	public List<AdminUserDto> userCount(String statics) throws Exception;

	public List<AdminSaleDto> recipeSaleCount(String statics) throws Exception;

}
