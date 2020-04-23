package yk.user.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yk.user.model.Recipe_InfoDto;
import yk.user.model.Recipe_ScrapDto;
import yk.user.service.ReadRecipeService;

@Controller
public class ReadRecipeController {
	
	private ReadRecipeService service;
	@Autowired
	public void setService(ReadRecipeService service) {
		this.service = service;
	}
	
	@RequestMapping("/recipe/read.do")
	public ModelAndView readRecipe(@RequestParam("recipe_id") int recipe_id,HttpSession session) {
		ModelAndView mav = new ModelAndView("recipe/readRecipe");
		String reader = (String) session.getAttribute("MINFO");
		String ipaddr = "";
		String onlyip = "";
		try {
			ipaddr = InetAddress.getLocalHost().toString();
			onlyip = ipaddr.substring(ipaddr.indexOf("/")+1);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		Recipe_InfoDto info = service.getRecipeInfo(recipe_id);
		service.plusReadcount(recipe_id);
		mav.addObject("info", info);
		mav.addObject("category",service.getRecipeCategory(recipe_id));
		mav.addObject("tag", service.getTag(recipe_id));
		mav.addObject("process", service.getPro(recipe_id));
		mav.addObject("writer", service.getWriter(info.getMember_id()));
		mav.addObject("sns", service.getSNS(info.getMember_id()));
		mav.addObject("ing", service.getIng(recipe_id));
		mav.addObject("ipaddr", onlyip);
		
		if(reader != null) {
			Recipe_ScrapDto scrap = new Recipe_ScrapDto();
			scrap.setRecipe_id(recipe_id);
			scrap.setScrap_member_id(reader);
			mav.addObject("scrap", service.checkScrap(scrap));
		}else {
			mav.addObject("scrap", 0);
		}
		
		return mav;
	}
	
}