package yk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yk.user.model.MembersDto;
import yk.user.model.RecipeIngredientDto;
import yk.user.model.Recipe_InfoDto;
import yk.user.model.Recipe_ProDto;
import yk.user.model.Recipe_ScrapDto;

@Service
public class ReadRecipeService {

	private ReadRecipeDao dao;

	@Autowired
	public void setDao(ReadRecipeDao dao) {
		this.dao = dao;
	}

	// 조회수
	public int plusReadcount(int recipe_id) {
		return dao.plusReadCount(recipe_id);
	}

	// 기본정보
	public Recipe_InfoDto getRecipeInfo(int recipe_id) {
		return dao.getRecipeInfo(recipe_id);
	}

	// 카테고리
	public List<String> getRecipeCategory(int recipe_id) {
		return dao.getRecipeCategory(recipe_id);
	}

	// 카테고리 번호
	public List<Integer> getRecipeCategoryId(int recipe_id) {
		return dao.getRecipeCategoryId(recipe_id);
	}

	// 태그
	public List<String> getTag(int recipe_id) {
		return dao.getTag(recipe_id);
	}

	// 과정
	public List<Recipe_ProDto> getPro(int recipe_id) {
		return dao.getPro(recipe_id);
	}

	// 작성자
	public MembersDto getWriter(String member_id) {
		return dao.getWriter(member_id);
	}

	// SNS
	public String getSNS(String chef) {
		return dao.getSNS(chef);
	}

	// 재료
	public List<RecipeIngredientDto> getIng(int recipe_id) {
		return dao.getIng(recipe_id);
	}

	// 스크랩 여부
	public int checkScrap(Recipe_ScrapDto dto) {
		return dao.checkScrap(dto);
	}

}
