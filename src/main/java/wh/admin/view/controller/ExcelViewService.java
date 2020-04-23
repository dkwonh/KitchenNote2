package wh.admin.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;
import wh.admin.view.dao.ExcelViewDao;
@Service
public class ExcelViewService {
	
	@Autowired
	ExcelViewDao excelViewDao;

	public void setExcelViewDao(ExcelViewDao excelViewDao) {
		this.excelViewDao = excelViewDao;
	}

	public List<MemberDto> userExcel(){
		return excelViewDao.userExcel();
	}
	
	public List<ChefDto> chefExcel(){
		return excelViewDao.chefExcel();
	}
	
	public List<DropMembersDto> dropExcel(){
		return excelViewDao.dropExcel();
	}
	
	public List<PayListDto> forkExcel(){
		return excelViewDao.forkExcel();
	}
	
	public List<PurchaseRecipeDto> recipeExcel(){
		return excelViewDao.recipeExcel();
	}
}
