package yh.admin.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import yh.admin.service.AdminStaticsService;

@Controller
@RequestMapping(value = "/adminStatics/")
public class AdminStaticsController {

	@Autowired
	AdminStaticsService service;

	private static final Logger logger = LoggerFactory.getLogger(AdminStaticsController.class);

	@RequestMapping(value = "adminStatics.do", method = RequestMethod.GET)
	public ModelAndView statics(String statics) throws Exception {

		List<AdminRecipeDto> recipe = new ArrayList<AdminRecipeDto>();
		List<AdminSaleDto> sale = new ArrayList<AdminSaleDto>();
		List<AdminUserDto> user = new ArrayList<AdminUserDto>();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminStatics/AdminStatics");

		recipe = service.recipeCount(statics);
		sale = service.recipeSaleCount(statics);
		user = service.userCount(statics);

		mav.addObject("statics", statics);
		mav.addObject("recipe", recipe);
		mav.addObject("sale", sale);
		mav.addObject("user", user);

		return mav;
	}

	@RequestMapping(value = "recipeAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String action(String statics, HttpServletResponse response) throws Exception {
		String data = "";

		List<AdminRecipeDto> recipe = new ArrayList<AdminRecipeDto>();

		recipe = service.recipeCount(statics);

		Gson json = new Gson();
		response.setContentType("text/html;charset=utf-8");

		if (recipe != null) {
			data += json.toJson(recipe);
		}
		return data;
	};

	@RequestMapping(value = "userAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String user(String statics, HttpServletResponse response) throws Exception {

		String data = "";
		List<AdminUserDto> user = new ArrayList<AdminUserDto>();
		user = service.userCount(statics);
		Gson json = new Gson();
		response.setContentType("text/html;charset=utf-8");

		if (user != null) {
			data += json.toJson(user);
		}
		return data;
	};

	@RequestMapping(value = "saleAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String sale(String statics, HttpServletResponse response) throws Exception {

		String data = "";
		List<AdminSaleDto> sale = new ArrayList<AdminSaleDto>();
		sale = service.recipeSaleCount(statics);
		Gson json = new Gson();
		response.setContentType("text/html;charset=utf-8"); 

		if (sale != null) {
			data = json.toJson(sale);
		}
		return data;
	};

}
