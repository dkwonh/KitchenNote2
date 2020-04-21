package yk.user.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yk.user.model.MembersDto;
import yk.user.model.RecipeIngredientDto;
import yk.user.model.Recipe_InfoDto;
import yk.user.model.Recipe_ProDto;
import yk.user.model.Recipe_ScrapDto;

public class ReadRecipeDao extends SqlSessionDaoSupport {
	// 조회수 증가
	public int plusReadCount(int recipe_id) {
		return getSqlSession().update("recipe.plusReadcount", recipe_id);
	}

	// 기본정보
	public Recipe_InfoDto getRecipeInfo(int recipe_id) {
		return getSqlSession().selectOne("recipe.getRecipeInfo", recipe_id);
	}

	// 카테고리
	public List<String> getRecipeCategory(int recipe_id) {
		return getSqlSession().selectList("recipe.getRecipeCategory", recipe_id);
	}

	// 카테고리번호
	public List<Integer> getRecipeCategoryId(int recipe_id) {
		return getSqlSession().selectList("recipe.getCagetoryid", recipe_id);
	}

	// 태그
	public List<String> getTag(int recipe_id) {
		return getSqlSession().selectList("recipe.getTag", recipe_id);
	}

	// 과정
	public List<Recipe_ProDto> getPro(int recipe_id) {
		return getSqlSession().selectList("recipe.getPro", recipe_id);
	}

	// 작성자
	public MembersDto getWriter(String member_id) {
		return getSqlSession().selectOne("recipe.getWriter", member_id);
	}

	// SNS
	public String getSNS(String chef) {
		return getSqlSession().selectOne("recipe.getSNS", chef);
	}

	// 재료
	public List<RecipeIngredientDto> getIng(int recipe_id) {
		return getSqlSession().selectList("recipe.getIng", recipe_id);
	}

	// 읽는사람 스크랩 여부
	public int checkScrap(Recipe_ScrapDto dto) {
		return getSqlSession().selectOne("recipe.checkScrap", dto);
	}

}
