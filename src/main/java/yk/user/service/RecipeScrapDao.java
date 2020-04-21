package yk.user.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yk.user.model.Recipe_ScrapDto;

public class RecipeScrapDao extends SqlSessionDaoSupport{
	
	public int checkScrap(Recipe_ScrapDto dto) {
		return getSqlSession().selectOne("recipe.checkScrap",dto);
	}
	
	public int addScrap(Recipe_ScrapDto dto) {
		return getSqlSession().insert("recipe.addScrap", dto);
	}
	
	public int plusScrap(int recipe_id) {
		return getSqlSession().update("recipe.plusScrap", recipe_id);
	}
	
	public int deleteScrap(Recipe_ScrapDto dto) {
		return getSqlSession().delete("recipe.deleteScrap", dto);
	}
	
	public int minusScrap(int recipe_id) {
		return getSqlSession().update("recipe.minusScrap",recipe_id);
	}
	
	public int scrapcount(int recipe_id) {
		return getSqlSession().selectOne("recipe.scrapcount", recipe_id);
	}
}
