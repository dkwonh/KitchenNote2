package jb.sample.service;

import java.util.List;

import jb.sample.model.RecipeDTO;

public interface BoardService {

	// 마이페이지 레시피-내가 작성한 레시피
	public List<RecipeDTO> recipelist(String member_id) throws Exception;

	// 마이페이지/레시피-구매한 레시피
	public List<RecipeDTO> paidlist(String member_id) throws Exception;

	// 팔로워 수
	public int getFollower(String member_id) throws Exception;

	// 팔로우 수
	public int getFollowing(String member_id) throws Exception;

	// 팔로워 리스트
	public List<RecipeDTO> followerlist(String member_id) throws Exception;

	// 팔로우 리스트
	public List<RecipeDTO> followinglist(String member_id) throws Exception;
	
	// 마이페이지/스크랩-리스트
	public List<RecipeDTO> scraplist(String member_id) throws Exception;
	
	// 마이페이지/댓글 - 리스트
		public List<RecipeDTO> commentlist(String member_id) throws Exception;
}
