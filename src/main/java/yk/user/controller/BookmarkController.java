package yk.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import yk.user.model.Recipe_ScrapDto;
import yk.user.service.RecipeScrapService;

@Controller
public class BookmarkController {
	
	private RecipeScrapService service;
	@Autowired
	public void setService(RecipeScrapService service) {
		this.service = service;
	}

	@RequestMapping(value="/recipe/checkscrap.do",method = RequestMethod.POST)
	@ResponseBody
	public String checkScrap(Recipe_ScrapDto dto) {
		int check = service.checkScrap(dto);
		Gson gson = new Gson();
		//System.out.println(gson.toJson(check));
		return gson.toJson(check);
	}
	
	@RequestMapping(value="/recipe/bookmark.do",method=RequestMethod.POST)
	@ResponseBody
	public String bookmark(Recipe_ScrapDto dto) {
		int c = service.addScrap(dto);
		int count = service.scrapcount(dto.getRecipe_id());
		List<Integer> list = new ArrayList<>();
		list.add(c);
		list.add(count);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@RequestMapping(value="/recipe/bookmark/destroy.do",method=RequestMethod.POST)
	@ResponseBody
	public String destroyBookmark(Recipe_ScrapDto dto) {
		int c = service.deleteScrap(dto);
		int count = service.scrapcount(dto.getRecipe_id());
		List<Integer> list = new ArrayList<>();
		list.add(c);
		list.add(count);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
}
