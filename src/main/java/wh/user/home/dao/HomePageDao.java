package wh.user.home.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.user.home.model.HomePageCategoryDto;
import wh.user.home.model.HomePageNangbuDto;
import wh.user.home.model.HomePageRecipeDto;

public class HomePageDao extends SqlSessionDaoSupport {

	// 메인화면에 보여질 레시피 리스트
	public List<HomePageRecipeDto> recipe_home() {
		return getSqlSession().selectList("home.recipe_home");
	}

	// 카테고리 리스트
	public List<HomePageCategoryDto> categoryName() {
		return getSqlSession().selectList("home.categoryName");
	}

	// 냉장고를 부탁해 재료로 찾기
	public List<HomePageRecipeDto> searchFromIngre(int[] ingredients) {
		return getSqlSession().selectList("home.searchFromIngre", ingredients);
	}

	// 이름으로 레시피 검색
	public List<HomePageRecipeDto> searchFromName(String recipe_name) {
		return getSqlSession().selectList("home.searchFromName", recipe_name);
	}

	// 냉부 재료 소분류 가져오기
	public List<HomePageNangbuDto> nangbuList(int ing_category) {
		return getSqlSession().selectList("home.nangbuList", ing_category);
	}

	// 냉부 대분류 가져오기
	public Map<Integer, String> nangbuCategoryList() {
		return getSqlSession().selectMap("home.nangbuCategoryList", "ing_category");
	}

	// 카테고리로 레시피 검색
	public List<HomePageRecipeDto> searchFromCategory(int category[]) {
		return getSqlSession().selectList("home.searchFromCategory", category);
	}
}
