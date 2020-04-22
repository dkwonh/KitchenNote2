package yk.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yk.user.model.Recipe_CommentDto;

@Service
public class RecipeCommentService {
	
	private RecipeCommentDao dao;
	@Autowired
	public void setDao(RecipeCommentDao dao) {
		this.dao = dao;
	}
	
	public int countComment(int recipe_id) {
		return dao.countComment(recipe_id);
	}
	
	public List<Recipe_CommentDto> getComment(Map<String,Integer> map){
		return dao.getComment(map);
	}
	
	public int writeComment(Recipe_CommentDto dto) {
		return dao.writeComment(dto);
	}
	
	public int deleteComment(Recipe_CommentDto dto) {
		return dao.deleteComment(dto);
	}
	
}
