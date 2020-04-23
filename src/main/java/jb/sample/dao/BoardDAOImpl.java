package jb.sample.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jb.sample.model.RecipeDTO;

@Repository("mypageDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "MypageMapper";

	// 마이페이지/레시피-내가 작성한 레시피
	public List<RecipeDTO> recipelist() throws Exception {
		return sql.selectList(namespace + ".recipelist");
	}

	// 마이페이지/레시피-내가 구매한 레시피
	public List<RecipeDTO> paidlist() throws Exception {
		return sql.selectList(namespace + ".paidlist");
	}

	// 팔로워 수
	public int getFollower() throws Exception {
		return sql.selectOne(namespace + ".follower");
	}

	// 팔로우 수
	public int getFollowing() throws Exception {
		return sql.selectOne(namespace + ".following");
	}

	// 팔로워 리스트
	public List<RecipeDTO> followerlist() throws Exception {
		return sql.selectList(namespace + ".followerlist");
	}

	// 팔로잉 리스트
	public List<RecipeDTO> followinglist() throws Exception {
		return sql.selectList(namespace + ".followinglist");
	}

	// 마이페이지/스크랩-리스트
	public List<RecipeDTO> scraplist() throws Exception {
		return sql.selectList(namespace + ".scraplist");
	}

	// 마이페이지/댓글 -리스트
	public List<RecipeDTO> commentlist() throws Exception {
		return sql.selectList(namespace + ".commentlist");
	}

}
