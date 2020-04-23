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
	public List<RecipeDTO> recipelist(String member_id) throws Exception {
		return sql.selectList(namespace + ".recipelist", member_id);
	}

	// 마이페이지/레시피-내가 구매한 레시피
	public List<RecipeDTO> paidlist(String member_id) throws Exception {
		return sql.selectList(namespace + ".paidlist", member_id);
	}

	// 팔로워 수
	public int getFollower(String member_id) throws Exception {
		return sql.selectOne(namespace + ".follower", member_id);
	}

	// 팔로우 수
	public int getFollowing(String member_id) throws Exception {
		return sql.selectOne(namespace + ".following", member_id);
	}

	// 팔로워 리스트
	public List<RecipeDTO> followerlist(String member_id) throws Exception {
		return sql.selectList(namespace + ".followerlist", member_id);
	}

	// 팔로잉 리스트
	public List<RecipeDTO> followinglist(String member_id) throws Exception {
		return sql.selectList(namespace + ".followinglist", member_id);
	}

	// 마이페이지/스크랩-리스트
	public List<RecipeDTO> scraplist(String member_id) throws Exception {
		return sql.selectList(namespace + ".scraplist", member_id);
	}

	// 마이페이지/댓글 -리스트
	public List<RecipeDTO> commentlist(String member_id) throws Exception {
		return sql.selectList(namespace + ".commentlist", member_id);
	}

}
