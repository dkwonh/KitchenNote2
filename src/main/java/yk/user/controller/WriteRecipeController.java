package yk.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import yk.user.model.WriteRecipeDto;
import yk.user.service.WriteRecipeService;

@Controller
public class WriteRecipeController {
	
	private WriteRecipeService service;	
	@Autowired
	public void setService(WriteRecipeService service) {
		this.service = service;
	}

	@RequestMapping("/recipe/write.do")
	public String writeForm() {
		return "recipe/writeForm";
	}
	
	@RequestMapping(value="/recipe/writePro.do",method = RequestMethod.POST)
	public ModelAndView writePro(WriteRecipeDto dto) {
		ModelAndView mav = new ModelAndView();
		int c = service.writeRecipe(dto);
		if(c > 0) {
			mav.setViewName("redirect:/index.jsp");
		}else {
			mav.setViewName("recipe/writeForm");
		}
		return mav;
	}
	
	@RequestMapping(value="/recipe/search_ing.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getIngName(@RequestParam(name = "ing_name")String ing_name) {
		List<String> ing_names = null;
		if(!(ing_name.trim().isEmpty())) {
			ing_names = service.getIngNames(ing_name);
		}
		Gson gson = new Gson();
		return gson.toJson(ing_names);
	}
}
