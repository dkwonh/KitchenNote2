package wh.user.home.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import wh.user.home.model.HomePageCategoryName;
import wh.user.home.model.HomePageMemberDto;
import wh.user.home.model.HomePageNangbuDto;
import wh.user.home.model.HomePageRecipeConfirmDto;
import wh.user.home.model.HomePageRecipeDto;
import wh.admin.manage.model.FilterDto;
import wh.admin.manage.model.NotifyDto;
import wh.admin.manage.model.PayListDto;

public class HomePageDao extends SqlSessionDaoSupport {
	
	public List<HomePageRecipeDto> recipe(){
		return getSqlSession().selectList("home.recipe_home");
	}

	// 메인화면에 보여질 레시피 리스트
	public List<HomePageRecipeDto> recipe_home(int category_id) {
		return getSqlSession().selectList("home.recommandRecipe",category_id);
	}

	// 카테고리 리스트
	public List<HomePageCategoryName> categoryName() {
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
	
	public HomePageCategoryName recommandName(int category_id) {
		return getSqlSession().selectOne("home.recommandName",category_id);
	}
	
	public List<NotifyDto> getNotifyList(FilterDto f){
		return getSqlSession().selectList("manage.getNotifyList",f);
	}
	
	public int getNotifyCount(FilterDto f) {
		return getSqlSession().selectOne("manage.getNotifyCount",f);
	}
	
	public NotifyDto getNotify(int num) {
		return getSqlSession().selectOne("manage.getNotify",num);
	}
	
	public HomePageRecipeConfirmDto getConfirm(HomePageRecipeConfirmDto req) {
		return getSqlSession().selectOne("home.getConfirm",req);
	}
	
	public HomePageMemberDto getMember(String member_id) {
		return getSqlSession().selectOne("home.getMember",member_id);
	}
	
	public int insertPur(HomePageRecipeConfirmDto recipe) {
		return getSqlSession().insert("home.insertPur",recipe);
	}
	
	public int updateFork(String member_id) {
		return getSqlSession().update("home.updateFork",member_id);
	}
}
