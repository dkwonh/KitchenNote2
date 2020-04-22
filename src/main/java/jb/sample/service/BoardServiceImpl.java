package jb.sample.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import jb.sample.dao.BoardDAO;
import jb.sample.model.BoardDTO;
import jb.sample.model.RecipeDTO;

@Service("mypageService")
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	// 내가 구매한 레시피
	public List<RecipeDTO> paidlist() throws Exception {
		return dao.paidlist();
	}

	// 마이페이지 레시피-게시글목록
	public List<RecipeDTO> recipelist() throws Exception {
		return dao.recipelist();
	}

	// 팔로워 수
	public int getFollower() throws Exception {
		return dao.getFollower();
	}

	// 팔로우 수
	public int getFollowing() throws Exception {
		return dao.getFollowing();
	}

	// 팔로워 리스트
	public List<RecipeDTO> followerlist() throws Exception {
		return dao.followerlist();
	}

	// 팔로우 수
	public List<RecipeDTO> followinglist() throws Exception {
		return dao.followinglist();
	}

	// 마이페이지/스크랩-리스트
	public List<RecipeDTO> scraplist() throws Exception {
		return dao.scraplist();
	}

	// 마이페이지/댓글-리스트
	public List<RecipeDTO> commentlist() throws Exception {
		return dao.commentlist();
	}
}