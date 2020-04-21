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

import yk.user.model.Recipe_InfoDto;
import yk.user.model.WriteRecipeDto;
import yk.user.service.ReadRecipeService;
import yk.user.service.UpdateRecipeService;

@Controller
public class UpdateRecipeController {
	
	private ReadRecipeService readservice;
	@Autowired
	public void setReadservice(ReadRecipeService readservice) {
		this.readservice = readservice;
	}
	
	private UpdateRecipeService updateservice;
	@Autowired
	public void setUpdateservice(UpdateRecipeService updateservice) {
		this.updateservice = updateservice;
	}

	@RequestMapping("/recipe/update.do")
	public ModelAndView getUpdateForm(@RequestParam("recipe_id")int recipe_id) {
		ModelAndView mav = new ModelAndView("recipe/updateForm");
		//가져올 값 : 기본정보, 재료, 과정, 태그
		Recipe_InfoDto info = readservice.getRecipeInfo(recipe_id);
		info.setDuration(info.getDuration().substring(0,info.getDuration().length()-1));
		mav.addObject("info", info);
		
		mav.addObject("ing", readservice.getIng(recipe_id));
		mav.addObject("process", readservice.getPro(recipe_id));
		mav.addObject("tag", readservice.getTag(recipe_id));
		
		return mav;
	}
	
	@RequestMapping(value="/recipe/update.do",method = RequestMethod.POST)
	public ModelAndView updatePro(WriteRecipeDto dto,int recipe_id) {
		int c = updateservice.updateRecipe(dto, recipe_id);
		if(c > 0) {
			return new ModelAndView("redirect:/recipe/read.do?recipe_id="+recipe_id);
		}else {
			return new ModelAndView("redirect:/recipe/update.do?recipe_id="+recipe_id);
		}
	}
	
	//카테고리번호
	@RequestMapping(value="/recipe/getCategoryId.do",method=RequestMethod.POST)
	@ResponseBody
	public String getCategoryId(@RequestParam("recipe_id")int recipe_id) {
		List<Integer> list = readservice.getRecipeCategoryId(recipe_id);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
}
