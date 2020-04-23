package wh.admin.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;
import wh.admin.manage.model.MemberDto;
import wh.admin.manage.model.PayListDto;
import wh.admin.manage.model.PurchaseRecipeDto;

@Controller
public class ExcelDownloadController {
	
	@Autowired
	ExcelViewService service;
	
	public void setService(ExcelViewService service) {
		this.service = service;
	}

	@RequestMapping(value="userToExcel.do", method=RequestMethod.POST)
	public ModelAndView userExcel() {
		List<MemberDto> list = service.userExcel();
		return new ModelAndView("userToExcel","userExcel",list);
		
	}
	
	@RequestMapping(value="chefToExcel.do", method=RequestMethod.POST)
	public ModelAndView chefExcel() {
		List<ChefDto> list = service.chefExcel();
		
		return new ModelAndView("chefToExcel","chefExcel",list);
		
	}
	
	@RequestMapping(value="dropToExcel.do", method=RequestMethod.POST)
	public ModelAndView dropExcel() {
		List<DropMembersDto> list = service.dropExcel();
		
		return new ModelAndView("dropToExcel","dropExcel",list);
		
	}
	
	@RequestMapping(value="forkToExcel.do",method=RequestMethod.POST)
	public ModelAndView forkExcel() {
		List<PayListDto> list = service.forkExcel();
		
		return new ModelAndView("forkToExcel","forkExcel",list);
		
	}
	
	@RequestMapping(value="recipeToExcel.do",method=RequestMethod.POST)
	public ModelAndView recipeExcel() {
		List<PurchaseRecipeDto> list = service.recipeExcel();
		
		return new ModelAndView("recipeToExcel","recipeExcel",list);
		
	}
}
