package wh.user.home.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.NotifyDto;
import wh.user.home.dao.HomePageDao;
import wh.user.home.model.HomePageCategoryName;
import wh.user.home.model.HomePageNangbuDto;
import wh.user.home.model.HomePageRecipeDto;

@Service
public class HomePageService {

	@Autowired
	HomePageDao homePageDao;
	
	public List<HomePageRecipeDto> recipe(){
		return homePageDao.recipe();
	}

	// 메인화면에 보여질 레시피 리스트
	public List<HomePageRecipeDto> recipe_home(int category_id) {
		return homePageDao.recipe_home(category_id);
	}

	// 카테고리 리스트
	public List<HomePageCategoryName> categoryName() {
		return homePageDao.categoryName();
	}

	// 냉장고를 부탁해 재료로 찾기
	public List<HomePageRecipeDto> searchFromIngre(int[] ingredients) {
		return homePageDao.searchFromIngre(ingredients);
	}

	// 이름으로 레시피 검색
	public List<HomePageRecipeDto> searchFromName(String recipe_name) {
		return homePageDao.searchFromName(recipe_name);
	}

	// 냉부 재료 소분류 가져오기
	public List<HomePageNangbuDto> nangbuList(int ing_category) {
		return homePageDao.nangbuList(ing_category);
	}

	// 냉부 대분류 가져오기
	public Map<Integer, String> nangbuCategoryList() {
		return homePageDao.nangbuCategoryList();
	}

	// 카테고리로 레시피 검색
	public List<HomePageRecipeDto> searchFromCategory(int category[]) {
		return homePageDao.searchFromCategory(category);
	}
	
	public HomePageCategoryName recommandName(int category_id) {
		return homePageDao.recommandName(category_id);
	}
	
	public List<NotifyDto> getNotifyList(FilterDto f){
		return homePageDao.getNotifyList(f);
	}
	
	public int getNotifyCount(FilterDto f) {
		return homePageDao.getNotifyCount(f);
	}
	
	public NotifyDto getNotify(int num) {
		return homePageDao.getNotify(num);
	}
}
