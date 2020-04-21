package yh.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import yh.admin.controller.AdminBoardDto;
import yh.admin.controller.FilterDto;

public class AdminBoardDaoImpl extends SqlSessionDaoSupport implements AdminBoardDao {

	public void create(AdminBoardDto dto) throws Exception {
		getSqlSession().insert("adminBoard.insert", dto);
	}

	public AdminBoardDto read(int num) throws Exception {
		return getSqlSession().selectOne("adminBoard.view", num);
	}

	public int update(AdminBoardDto dto) throws Exception {
		return getSqlSession().update("adminBoard.updateArticle", dto);
	}

	public void delete(int num) throws Exception {
		getSqlSession().delete("adminBoard.deleteArticle", num);
	}

	public List<AdminBoardDto> listAll(FilterDto dto) throws Exception {
		return getSqlSession().selectList("adminBoard.listAll", dto);
	}

	public void increaseViewcnt(int num) throws Exception {
		getSqlSession().update("adminBoard.increaseViewcnt", num);
	}

	public int count(FilterDto dto) throws Exception {
		return getSqlSession().selectOne("adminBoard.count",dto);
	}

}