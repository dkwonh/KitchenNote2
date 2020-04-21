package yh.admin.model;

import java.util.List;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;

public interface AdminStaticsDao {

	public List<AdminRecipeDto> recipeCount() throws Exception;

	public List<AdminUserDto> userCount() throws Exception;

	public List<AdminSaleDto> recipeSaleCount() throws Exception;

}
