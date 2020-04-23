package jb.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import jb.sample.dao.BoardDAO;
import jb.sample.model.RecipeDTO;

@Service("mypageService")
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	// 내가 구매한 레시피
	public List<RecipeDTO> paidlist(String member_id) throws Exception {
		return dao.paidlist(member_id);
	}

	// 마이페이지 레시피-게시글목록
	public List<RecipeDTO> recipelist(String member_id) throws Exception {
		return dao.recipelist(member_id);
	}

	// 팔로우 하기
	public List<RecipeDTO> follow() throws Exception {
		return dao.follow();
	}

	// 언팔로우 하기
	public List<RecipeDTO> unfollow() throws Exception {
		return dao.unfollow();
	}

	// 팔로워 수
	public int getFollower(String member_id) throws Exception {
		return dao.getFollower(member_id);
	}

	// 팔로우 수
	public int getFollowing(String member_id) throws Exception {
		return dao.getFollowing(member_id);
	}

	// 팔로워 리스트
	public List<RecipeDTO> followerlist(String member_id) throws Exception {
		return dao.followerlist(member_id);
	}

	// 팔로우 수
	public List<RecipeDTO> followinglist(String member_id) throws Exception {
		return dao.followinglist(member_id);
	}

	// 마이페이지/스크랩-리스트
	public List<RecipeDTO> scraplist(String member_id) throws Exception {
		return dao.scraplist(member_id);
	}

	// 마이페이지/댓글-리스트
	public List<RecipeDTO> commentlist(String member_id) throws Exception {
		return dao.commentlist(member_id);
	}
}