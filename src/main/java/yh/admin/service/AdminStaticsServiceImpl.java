package yh.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.AdminRecipeDto;
import yh.admin.controller.AdminSaleDto;
import yh.admin.controller.AdminUserDto;
import yh.admin.model.AdminStaticsDao;

// 홈페이지 통계
@Service
public class AdminStaticsServiceImpl implements AdminStaticsService {

	@Autowired
	AdminStaticsDao dao;

	@Override
	public List<AdminRecipeDto> recipeCount(String statics) throws Exception {

		return dao.recipeCount(statics);
	}

	@Override
	public List<AdminUserDto> userCount(String statics) throws Exception {
		return dao.userCount(statics);
	}

	@Override
	public List<AdminSaleDto> recipeSaleCount(String statics) throws Exception {
		return dao.recipeSaleCount(statics);
	}

}
