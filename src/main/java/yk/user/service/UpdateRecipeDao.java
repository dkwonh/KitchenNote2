package yk.user.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yk.user.model.Recipe_InfoDto;

public class UpdateRecipeDao extends SqlSessionDaoSupport {
	
	//레시피 수정
	public int infoUpdate(Recipe_InfoDto dto) {
		return getSqlSession().update("recipe.updateInfo", dto);
	}
	
	//카테고리삭제
	public int delCategory(int recipe_id) {
		return getSqlSession().delete("recipe.delCategory", recipe_id);
	}
	
	//재료 삭제
	public int delIng(int recipe_id) {
		return getSqlSession().delete("recipe.delIng", recipe_id);
	}
	
	//과정 삭제
	public int delPro(int recipe_id) {
		return getSqlSession().delete("recipe.delPro", recipe_id);
	}
	
	//태그 삭제
	public int delTag(int recipe_id) {
		return getSqlSession().delete("recipe.delTag", recipe_id);
	}
	

}
