package yh.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yh.admin.controller.AdminStaticsDto;
import yh.admin.model.AdminStaticsDao;

@Service
public class AdminStaticsServiceImpl implements AdminStaticsService {

	@Autowired
	AdminStaticsDao dao;
	
	@Override
	public AdminStaticsDto recipeCount(int recipeCount) throws Exception{
		AdminStaticsDto dto = dao.recipeCount(recipeCount);
		return dto;
	}
	@Override
	public AdminStaticsDto userCount(int userCount) throws Exception{
		AdminStaticsDto dto = dao.userCount(userCount);
		return dto;
	}
	
	@Override
	public AdminStaticsDto recipeSaleCount(int recipeSaleCount) throws Exception{
		AdminStaticsDto dto = dao.recipeSaleCount(recipeSaleCount);
		return dto;
	}
}
