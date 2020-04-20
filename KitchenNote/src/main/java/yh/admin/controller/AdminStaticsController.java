package yh.admin.controller;

import java.util.Locale;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yh.admin.service.AdminStaticsService;

@Controller
@RequestMapping(value = "/adminStatics/")
public class AdminStaticsController {

	@Autowired
	AdminStaticsService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStaticsController.class);
	
	  @RequestMapping(value = "AdminStatics.do", method = RequestMethod.GET)
	  	public ModelAndView statics(@RequestParam(value="recipeCount",required = false)int recipeCount
	  			,@RequestParam(value="userCount",required = false) int userCount
	  			,@RequestParam(value="recipeSaleCount", required = false) int recipeSaleCount)throws Exception {
		  
		  AdminStaticsDto dto;
		  
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("adminStatics/AdminStatics");
		  mav.addObject("recipeCount",recipeCount);
		  mav.addObject("userCount",userCount);
		  mav.addObject("recipeSaleCount",recipeSaleCount);
		  return mav;

	  	}
	
}
