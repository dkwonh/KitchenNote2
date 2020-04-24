package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminBoardDto;
import yh.admin.controller.FilterDto;

// 1:1 문의 관리자 DAO IMPL
public class AdminBoardDaoImpl extends SqlSessionDaoSupport implements AdminBoardDao {

	public void create(AdminBoardDto dto) throws Exception {
		getSqlSession().insert("adminBoard.insert", dto);
	} // 게시글 작성

	public AdminBoardDto read(int num) throws Exception {
		return getSqlSession().selectOne("adminBoard.view", num);
	} // 상세 보기

	public int update(AdminBoardDto dto) throws Exception {
		return getSqlSession().update("adminBoard.updateArticle", dto);
	} // 수정

	public void delete(int num) throws Exception {
		getSqlSession().delete("adminBoard.deleteArticle", num);
	} // 삭제

	public List<AdminBoardDto> listAll(FilterDto dto) throws Exception {
		return getSqlSession().selectList("adminBoard.listAll", dto);
	}// 게시글 리스트

	public void increaseViewcnt(int num) throws Exception {
		getSqlSession().update("adminBoard.increaseViewcnt", num);
	} // 조회수 증가

	public int count(FilterDto dto) throws Exception {
		return getSqlSession().selectOne("adminBoard.count",dto);
	}

}
