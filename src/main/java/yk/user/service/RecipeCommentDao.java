package yk.user.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yk.user.model.Recipe_CommentDto;

public class RecipeCommentDao extends SqlSessionDaoSupport{
	
	public int countComment(int recipe_id) {
		return getSqlSession().selectOne("recipeComment.countComment",recipe_id);
	}
	
	public List<Recipe_CommentDto> getComment(Map<String,Integer> map){
		return getSqlSession().selectList("recipeComment.getComment", map);
	}
	
	public int writeComment(Recipe_CommentDto dto){
		return getSqlSession().insert("recipeComment.writeComment", dto);
	}
	
	public int deleteComment(Recipe_CommentDto dto) {
		return getSqlSession().insert("recipeComment.deleteComment", dto);
	}
	
}
