package yk.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import yk.user.model.Recipe_CommentDto;
import yk.user.service.RecipeCommentService;

@Controller
public class RecipeCommentController {
	public static final int PAGE_SIZE = 8;
	int startPage;
	int endPage;
	int pageBlock;
	int pageCount;

	public void pageCalc(int pageNum, int count) {
		if (count > 0) {
			startPage = 1;
			if (pageNum % 10 != 0) {
				startPage = (int) (pageNum / 10) * 10 + 1;
			} else {
				startPage = ((int) (pageNum / 10) - 1) * 10 + 1;
			}
			pageBlock = 10;
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
		}
	}

	private RecipeCommentService service;

	@Autowired
	public void setService(RecipeCommentService service) {
		this.service = service;
	}

	@RequestMapping(value="/recipe/comment.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String commentList(@RequestParam("recipe_id") int recipe_id,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		// 페이징
		int c = service.countComment(recipe_id);
		pageCount = c / PAGE_SIZE + (c % PAGE_SIZE == 0 ? 0 : 1);
		pageCalc(page, c);

		// 시작번호
		int start = ((page - 1) * PAGE_SIZE);

		// 댓글가져오기
		List<Recipe_CommentDto> comments = getCommentlist(recipe_id, start, PAGE_SIZE);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0;i<comments.size();i++) {
			comments.get(i).setCommentDate(sdf.format(comments.get(i).getComment_date()));
		}
		List<Object> list = new ArrayList<>();

		list.add(pageCount);
		list.add(startPage);
		list.add(endPage);
		list.add(pageBlock);
		list.add(comments);

		Gson gson = new Gson();
		return gson.toJson(list);
	}

	@RequestMapping(value="/recipe/newComment.do",method = RequestMethod.POST,produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String addComment(Recipe_CommentDto dto) {
		// 댓글쓰기
		int c = service.writeComment(dto);

		Gson gson = new Gson();
		return gson.toJson(c);

	}

	@RequestMapping(value="/recipe/deleteComment.do",method=RequestMethod.POST)
	@ResponseBody
	public String deleteComment(Recipe_CommentDto dto) {
		// 댓글 지우기
		int c = service.deleteComment(dto);

		Gson gson = new Gson();
		System.out.println(gson.toJson(c));
		return gson.toJson(c);

	}

	public List<Recipe_CommentDto> getCommentlist(int recipe_id, int start, int size) {
		Map<String, Integer> map = new HashMap<>();
		map.put("recipe_id", recipe_id);
		map.put("startNum", start);
		map.put("pageSize", size);
		List<Recipe_CommentDto> comments = service.getComment(map);
		return comments;
	}

}
