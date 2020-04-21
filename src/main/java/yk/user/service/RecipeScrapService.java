package yk.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yk.user.model.Recipe_ScrapDto;

@Service
public class RecipeScrapService {
	
	private RecipeScrapDao dao;
	@Autowired
	public void setDao(RecipeScrapDao dao) {
		this.dao = dao;
	}
	
	public int checkScrap(Recipe_ScrapDto dto) {
		return dao.checkScrap(dto);
	}
	
	public int addScrap(Recipe_ScrapDto dto) {
		int c = 0;
		try {
			c += dao.addScrap(dto);
			c += dao.plusScrap(dto.getRecipe_id());
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return c;
	}
	
	public int deleteScrap(Recipe_ScrapDto dto) {
		int c = 0;
		try {
			c+= dao.deleteScrap(dto);
			c+= dao.minusScrap(dto.getRecipe_id());
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return c;
	}
	
	public int scrapcount(int recipe_id) {
		return dao.scrapcount(recipe_id);
	}
	
	
}
