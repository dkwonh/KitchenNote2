package yh.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;
import yh.admin.model.AdminStaticsDao;

@Service
public class AdminStaticsServiceImpl implements AdminStaticsService {

	@Autowired
	AdminStaticsDao dao;

	@Override
	public List<AdminRecipeDto> recipeCount() throws Exception {

		return dao.recipeCount();
	}

	@Override
	public List<AdminUserDto> userCount() throws Exception {
		return dao.userCount();
	}

	@Override
	public List<AdminSaleDto> recipeSaleCount() throws Exception {
		return dao.recipeSaleCount();
	}

}
