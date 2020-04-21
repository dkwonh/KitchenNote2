package yk.user.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yk.user.model.Recipe_CategoryDto;
import yk.user.model.Recipe_ProDto;
import yk.user.model.TagDto;
import yk.user.model.WriteRecipeDto;

public class WriteRecipeDao extends SqlSessionDaoSupport{
	
	//재료이름 자동완성
	public List<String> getIngNames(String ing_name){
		return getSqlSession().selectList("recipe.ing_names",ing_name);
	}
	
	//기본정보
	public int addRecipeInfo(WriteRecipeDto dto) {
		return getSqlSession().insert("recipe.addRecipeInfo", dto);
	}
	
	//레시피 아이디
	public int getRecipeId(String member_id) {
		return getSqlSession().selectOne("recipe.getRecipeId", member_id);
	}
	
	//카테고리
	public int addRecipeCategory(Recipe_CategoryDto dto) {
		return getSqlSession().insert("recipe.addRecipeCategory", dto);
	}
	
	// -- 재료찾기 --
	public int checkIng(String ing_name) {
		return getSqlSession().selectOne("recipe.checkIng",ing_name);
	}
	
	// 있으면 번호 가져오기
	public int getIngId(String ing_name) {
		return getSqlSession().selectOne("recipe.getIngId",ing_name);
	}
	
	//없으면 재료 테이블에 추가
	public int getMaxIngId() {
		return getSqlSession().selectOne("recipe.getMaxIngId");
	}
	public int addIng(Map<String,Object> map) {
		return getSqlSession().insert("recipe.addIng",map);
	}
	
	//레시피 재료 넣기
	public int addRecipeIng(Map<String,Object> map) {
		return getSqlSession().insert("recipe.addRecipeIng", map);
	}
	
	//과정
	public int addRecipePro(Recipe_ProDto dto) {
		return getSqlSession().insert("recipe.addRecipePro", dto);
	}
	
	//태그
	public int addRecipeTag(TagDto dto) {
		return getSqlSession().insert("recipe.addRecipeTag", dto);
	}
	
}
